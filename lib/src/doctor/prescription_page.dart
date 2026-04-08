import 'dart:typed_data';

import 'package:backend_client/backend_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';

import '../shared/prescription_pdf_template.dart';
import 'dosage_times.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({
    super.key,
    this.initialPatientName,
    this.initialPatientNumber,
    this.initialPatientGender,
    this.initialPatientAge,
    this.initialPrescribedItems,
  });

  final String? initialPatientName;
  final String? initialPatientNumber;
  final String? initialPatientGender;
  final int? initialPatientAge;
  final List<PatientPrescribedItem>? initialPrescribedItems;

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _ccController = TextEditingController();
  final TextEditingController _adviceController = TextEditingController();
  final TextEditingController _investigationController =
      TextEditingController();
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _nextVisitController = TextEditingController();

  final List<_MedicineFormRow> _medicineRows = [];

  String? _selectedGender;
  bool _isOutside = false;
  bool _isSaving = false;
  bool _isPrinting = false;
  bool _isSaved = false;
  bool _loadingDoctorInfo = false;
  bool _isNormalizingPhone = false;

  String? _doctorName;
  String? _doctorSignatureUrl;

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.initialPatientName?.trim() ?? '';
    _phoneController.text = widget.initialPatientNumber?.trim() ?? '';
    if (widget.initialPatientAge != null) {
      _ageController.text = widget.initialPatientAge.toString();
    }

    final gender = widget.initialPatientGender?.trim().toLowerCase();
    if (gender == 'male' || gender == 'm') {
      _selectedGender = 'Male';
    } else if (gender == 'female' || gender == 'f') {
      _selectedGender = 'Female';
    } else if (gender == 'other') {
      _selectedGender = 'Other';
    }

    if (widget.initialPrescribedItems != null &&
        widget.initialPrescribedItems!.isNotEmpty) {
      _seedMedicinesFromExisting(widget.initialPrescribedItems!);
    } else {
      final row = _MedicineFormRow();
      _wireMedicineRow(row);
      _medicineRows.add(row);
    }

    _phoneController.addListener(_normalizePhoneNumber);
    for (final controller in [
      _nameController,
      _phoneController,
      _ageController,
      _ccController,
      _adviceController,
      _investigationController,
      _bpController,
      _temperatureController,
      _nextVisitController,
    ]) {
      controller.addListener(_markUnsaved);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _normalizePhoneNumber();
      _loadDoctorInfo();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _ccController.dispose();
    _adviceController.dispose();
    _investigationController.dispose();
    _bpController.dispose();
    _temperatureController.dispose();
    _nextVisitController.dispose();
    for (final row in _medicineRows) {
      row.dispose();
    }
    super.dispose();
  }

  void _markUnsaved() {
    if (_isSaved && mounted) {
      setState(() => _isSaved = false);
    }
  }

  void _normalizePhoneNumber() {
    if (_isNormalizingPhone) return;
    _isNormalizingPhone = true;

    try {
      final raw = _phoneController.text;
      final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
      final normalized = digits.length <= 11
          ? digits
          : digits.substring(digits.length - 11);

      if (normalized == raw) return;

      _phoneController.value = TextEditingValue(
        text: normalized,
        selection: TextSelection.collapsed(offset: normalized.length),
      );
    } finally {
      _isNormalizingPhone = false;
    }
  }

  void _seedMedicinesFromExisting(List<PatientPrescribedItem> items) {
    _medicineRows.clear();
    for (final item in items) {
      final row = _MedicineFormRow();
      row.nameController.text = item.medicineName;
      if (item.duration != null) {
        row.durationController.text = item.duration.toString();
      }

      final rawDosage = (item.dosageTimes ?? '').trim();
      row.isFourTimes = isDosageFourTimes(rawDosage);
      row.times = Map<String, bool>.from(
        decodeDosageTimesToBanglaMap(rawDosage),
      );

      final mealTiming = (item.mealTiming ?? '').trim();
      final lowerMeal = mealTiming.toLowerCase();
      if (lowerMeal.contains('before')) {
        row.mealTiming = 'before';
      } else if (lowerMeal.contains('after')) {
        row.mealTiming = 'after';
      }

      final cleanedMeal = mealTiming
          .replaceAll(RegExp(r'(?i)before meal'), '')
          .replaceAll(RegExp(r'(?i)after meal'), '')
          .replaceAll(RegExp(r'^[,\s]+|[,\s]+$'), '')
          .trim();
      row.mealTimeController.text = cleanedMeal;

      _wireMedicineRow(row);
      _medicineRows.add(row);
    }

    if (_medicineRows.isEmpty) {
      final row = _MedicineFormRow();
      _wireMedicineRow(row);
      _medicineRows.add(row);
    }
  }

  Future<void> _loadDoctorInfo() async {
    setState(() => _loadingDoctorInfo = true);
    try {
      final profile = await client.doctor.getDoctorProfile(0);
      if (!mounted) return;
      setState(() {
        _doctorName = profile?.name?.trim();
        _doctorSignatureUrl = profile?.signatureUrl?.trim();
      });
    } catch (_) {
      if (!mounted) return;
    } finally {
      if (mounted) {
        setState(() => _loadingDoctorInfo = false);
      }
    }
  }

  Future<Uint8List?> _loadNetworkBytes(String? url) async {
    if (url == null || url.trim().isEmpty) return null;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (_) {}
    return null;
  }

  void _wireMedicineRow(_MedicineFormRow row) {
    row.nameController.addListener(_markUnsaved);
    row.durationController.addListener(_markUnsaved);
    row.mealTimeController.addListener(_markUnsaved);
  }

  void _addMedicineRow() {
    final row = _MedicineFormRow();
    _wireMedicineRow(row);
    setState(() {
      _medicineRows.add(row);
      _isSaved = false;
    });
  }

  void _removeMedicineRow(int index) {
    if (_medicineRows.length <= 1) return;
    final removed = _medicineRows.removeAt(index);
    removed.dispose();
    setState(() => _isSaved = false);
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _ageController.clear();
    _ccController.clear();
    _adviceController.clear();
    _investigationController.clear();
    _bpController.clear();
    _temperatureController.clear();
    _nextVisitController.clear();

    for (final row in _medicineRows) {
      row.dispose();
    }

    final row = _MedicineFormRow();
    _wireMedicineRow(row);

    setState(() {
      _selectedGender = null;
      _isOutside = false;
      _isSaved = false;
      _selectedDate = DateTime.now();
      _medicineRows
        ..clear()
        ..add(row);
    });
  }

  String _valueOrDash(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  String _formattedMealInstruction(_MedicineFormRow row) {
    final mealLabel = switch (row.mealTiming) {
      'before' => 'Before meal',
      'after' => 'After meal',
      _ => '-',
    };
    final time = row.mealTimeController.text.trim();
    if (time.isEmpty) return mealLabel;
    if (mealLabel == '-') return time;
    return '$time, $mealLabel';
  }

  String _buildOnExaminationText() {
    final parts = <String>[];
    if (_bpController.text.trim().isNotEmpty) {
      parts.add('BP: ${_bpController.text.trim()}');
    }
    if (_temperatureController.text.trim().isNotEmpty) {
      parts.add('Temperature: ${_temperatureController.text.trim()} °F');
    }
    return parts.join('\n');
  }

  bool _validateForm() {
    if (_nameController.text.trim().isEmpty) {
      _showSnack('Patient name is required.');
      return false;
    }
    final phone = _phoneController.text.trim();
    if (phone.length != 11 || !phone.startsWith('01')) {
      _showSnack('Enter a valid 11-digit mobile number starting with 01.');
      return false;
    }
    if (_ageController.text.trim().isEmpty) {
      _showSnack('Patient age is required.');
      return false;
    }
    if (_selectedGender == null || _selectedGender!.trim().isEmpty) {
      _showSnack('Please select patient gender.');
      return false;
    }

    final hasMedicine = _medicineRows.any(
      (row) => row.nameController.text.trim().isNotEmpty,
    );
    if (!hasMedicine) {
      _showSnack('Add at least one medicine.');
      return false;
    }

    for (final row in _medicineRows) {
      if (row.nameController.text.trim().isEmpty) continue;
      final dosageCount = row.isFourTimes
          ? 4
          : row.times.values.where((selected) => selected).length;
      if (dosageCount == 0) {
        _showSnack('Select dosage timing for each added medicine.');
        return false;
      }
      if (row.durationController.text.trim().isEmpty) {
        _showSnack('Enter duration for each added medicine.');
        return false;
      }
    }

    return true;
  }

  List<PrescribedItem> _buildPrescribedItems() {
    return _medicineRows
        .where((row) => row.nameController.text.trim().isNotEmpty)
        .map((row) {
          final rawDuration = row.durationController.text.trim();
          final duration = int.tryParse(rawDuration);
          return PrescribedItem(
            prescriptionId: 0,
            medicineName: row.nameController.text.trim(),
            dosageTimes: encodeDosageTimes(
              times: row.times,
              four: row.isFourTimes,
            ),
            mealTiming: _formattedMealInstruction(row),
            duration: duration,
          );
        })
        .toList();
  }

  List<PrescriptionPdfMedicine> _buildPdfMedicines() {
    return _medicineRows
        .where((row) => row.nameController.text.trim().isNotEmpty)
        .map((row) {
          final encodedDosage = encodeDosageTimes(
            times: row.times,
            four: row.isFourTimes,
          );
          final perDay = dosageTimesPerDay(encodedDosage);
          return PrescriptionPdfMedicine(
            name: _valueOrDash(row.nameController.text),
            dosage: _valueOrDash(dosageTimesDisplayEnglish(encodedDosage)),
            frequency: perDay <= 0 ? '-' : '$perDay time(s)/day',
            duration: row.durationController.text.trim().isEmpty
                ? '-'
                : '${row.durationController.text.trim()} days',
            instructions: _formattedMealInstruction(row),
          );
        })
        .toList();
  }

  Future<Uint8List> _buildPrescriptionPdfBytes() async {
    final signatureBytes = await _loadNetworkBytes(_doctorSignatureUrl);

    return buildUnifiedPrescriptionPdf(
      PrescriptionPdfPayload(
        patientName: _valueOrDash(_nameController.text),
        mobile: _valueOrDash(_phoneController.text),
        age: _ageController.text.trim().isEmpty
            ? '-'
            : '${_ageController.text.trim()} yrs',
        gender: _valueOrDash(_selectedGender ?? ''),
        bloodGroup: '-',
        patientId: 'NEW',
        date:
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
        chiefComplaint: _valueOrDash(_ccController.text),
        onExamination: _valueOrDash(_buildOnExaminationText()),
        advice: _valueOrDash(_adviceController.text),
        investigation: _valueOrDash(_investigationController.text),
        nextVisit: _nextVisitController.text.trim().isEmpty
            ? '-'
            : '${_nextVisitController.text.trim()} days',
        medicines: _buildPdfMedicines(),
        doctorName: _doctorName,
        doctorSignatureBytes: signatureBytes,
      ),
    );
  }

  Future<void> _handlePrint() async {
    if (_isPrinting) return;
    if (!_validateForm()) return;

    setState(() => _isPrinting = true);
    try {
      final pdfBytes = await _buildPrescriptionPdfBytes();
      await Printing.layoutPdf(onLayout: (_) async => pdfBytes);
    } catch (e) {
      _showSnack('Failed to print prescription: $e');
    } finally {
      if (mounted) {
        setState(() => _isPrinting = false);
      }
    }
  }

  Future<void> _savePrescription({bool printAfterSave = false}) async {
    if (_isSaving) return;
    if (!_validateForm()) return;

    final items = _buildPrescribedItems();
    final examinationText = _buildOnExaminationText().trim();
    final prescription = Prescription(
      doctorId: 0,
      name: _nameController.text.trim(),
      mobileNumber: _phoneController.text.trim(),
      age: int.tryParse(_ageController.text.trim()),
      gender: _selectedGender,
      prescriptionDate: _selectedDate,
      cc: _ccController.text.trim().isEmpty ? null : _ccController.text.trim(),
      oe: examinationText.isEmpty ? null : examinationText,
      advice: _adviceController.text.trim().isEmpty
          ? null
          : _adviceController.text.trim(),
      test: _investigationController.text.trim(),
      nextVisit: _nextVisitController.text.trim().isEmpty
          ? null
          : '${_nextVisitController.text.trim()} days',
      isOutside: _isOutside,
    );

    setState(() => _isSaving = true);
    try {
      final resultId = await client.doctor.createPrescription(
        prescription,
        items,
        _phoneController.text.trim(),
      );

      if (!mounted) return;

      setState(() => _isSaved = resultId > 0);

      if (resultId <= 0) {
        _showSnack('Failed to save prescription.');
        return;
      }

      if (printAfterSave) {
        await _handlePrint();
      }

      _showSnack(
        printAfterSave
            ? 'Prescription #$resultId saved and print preview opened.'
            : 'Prescription #$resultId saved successfully.',
      );

      if (Navigator.of(context).canPop()) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        if (mounted) Navigator.of(context).pop(true);
      }
    } catch (e) {
      _showSnack('Failed to save prescription: $e');
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildHeaderCard() {
    final todayLabel =
        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Container(
              width: 84,
              height: 84,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/nstu_logo.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.local_hospital,
                    size: 48,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/prescription_download_heading.png',
                    height: 74,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'মেডিকেল সেন্টার',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'নোয়াখালী বিজ্ঞান ও প্রযুক্তি বিশ্ববিদ্যালয়',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Noakhali Science and Technology University',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 6,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'Doctor Prescription',
                          style: TextStyle(
                            color: Color(0xFF1D4ED8),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      Text(
                        'Date: $todayLabel',
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientHeroCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E4DA1), Color(0xFF0EA5E9)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1E4DA1), Color(0xFF0EA5E9)],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundColor: Color(0xFFE8F1FF),
                    child: Icon(
                      Icons.person,
                      size: 32,
                      color: Color(0xFF1E4DA1),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _nameController.text.trim().isEmpty
                            ? 'Unnamed Patient'
                            : _nameController.text.trim(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          _patientMetaChip(
                            Icons.phone_outlined,
                            _phoneController.text.trim().isEmpty
                                ? '-'
                                : _phoneController.text.trim(),
                          ),
                          _patientMetaChip(
                            Icons.cake_outlined,
                            _ageController.text.trim().isEmpty
                                ? '-'
                                : '${_ageController.text.trim()} yrs',
                          ),
                          _patientMetaChip(
                            Icons.wc_outlined,
                            _selectedGender ?? '-',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required Widget child,
    Widget? trailing,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 18, color: iconColor),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                if (trailing != null) ...[const Spacer(), trailing],
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }

  Widget _patientMetaChip(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: const Color(0xFF64748B)),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      filled: true,
      fillColor: const Color(0xFFF1F5F9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      ),
    );
  }

  Widget _buildMedicineTile(_MedicineFormRow row, int index) {
    final selectedDosage = row.isFourTimes
        ? '4 times'
        : row.times.entries.where((e) => e.value).map((e) => e.key).join(', ');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          // Row 1: medicine + dosage summary + remove
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue.shade50,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: TextField(
                  controller: row.nameController,
                  decoration: _inputDecoration('Medicine name'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Container(
                  height: 48,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    selectedDosage.isEmpty ? '-' : selectedDosage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF334155),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _medicineRows.length == 1
                    ? null
                    : () => _removeMedicineRow(index),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Row 2: dosage selectors
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...row.times.keys.map(
                  (key) => FilterChip(
                    label: Text(key),
                    selected: row.times[key] ?? false,
                    onSelected: (selected) {
                      setState(() {
                        row.times[key] = selected;
                        _isSaved = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Row 3: frequency + duration
          Row(
            children: [
              Expanded(
                flex: 4,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment<String>(
                      value: 'before',
                      label: Text('Before meal'),
                    ),
                    ButtonSegment<String>(
                      value: 'after',
                      label: Text('After meal'),
                    ),
                  ],
                  selected: {row.mealTiming},
                  onSelectionChanged: (selection) {
                    setState(() {
                      row.mealTiming = selection.first;
                      _isSaved = false;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: row.durationController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: _inputDecoration('Duration'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Row 4: optional time note / instruction
          TextField(
            controller: row.mealTimeController,
            decoration: _inputDecoration(
              'Instruction / time note',
              hint: 'Optional',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Prescription'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: _isPrinting ? null : _handlePrint,
            tooltip: 'Print',
            icon: _isPrinting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.print_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 12),
            _buildPatientHeroCard(),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 1100;

                final leftPane = Column(
                  children: [
                    _sectionCard(
                      icon: Icons.person_outline,
                      iconColor: const Color(0xFF1D4ED8),
                      iconBg: const Color(0xFFEFF6FF),
                      title: 'Patient Information',
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: _inputDecoration('Patient name'),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9+ -]'),
                              ),
                            ],
                            decoration: _inputDecoration('Mobile number'),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _ageController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: _inputDecoration('Age'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: _selectedGender,
                                  decoration: _inputDecoration('Gender'),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Male',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Female',
                                      child: Text('Female'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Other',
                                      child: Text('Other'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                      _isSaved = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _sectionCard(
                      icon: Icons.medical_information_outlined,
                      iconColor: const Color(0xFF7C3AED),
                      iconBg: const Color(0xFFF5F3FF),
                      title: 'Diagnosis & Clinical Notes',
                      child: Column(
                        children: [
                          TextField(
                            controller: _ccController,
                            maxLines: 5,
                            decoration: _inputDecoration('Chief complaint'),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _investigationController,
                            maxLines: 3,
                            decoration: _inputDecoration(
                              'Investigations / tests',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _sectionCard(
                      icon: Icons.monitor_heart_outlined,
                      iconColor: const Color(0xFFDC2626),
                      iconBg: const Color(0xFFFFF1F2),
                      title: 'Vitals',
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _bpController,
                              decoration: _inputDecoration('Blood pressure'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _temperatureController,
                              decoration: _inputDecoration('Temperature (°F)'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );

                final rightPane = _sectionCard(
                  icon: Icons.medication_outlined,
                  iconColor: const Color(0xFF0369A1),
                  iconBg: const Color(0xFFE0F2FE),
                  title: 'Medicines, Advice & Signature',
                  trailing: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF2563EB),
                    ),
                    onPressed: _addMedicineRow,
                    icon: const Icon(Icons.add_circle_outline, size: 18),
                    label: const Text('Add Medicine'),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 34),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Medicine',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2563EB),
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Dosage',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2563EB),
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      for (var i = 0; i < _medicineRows.length; i++)
                        _buildMedicineTile(_medicineRows[i], i),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _adviceController,
                        maxLines: 4,
                        decoration: _inputDecoration('Advice'),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _nextVisitController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: _inputDecoration('Next visit (days)'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CheckboxListTile(
                              value: _isOutside,
                              onChanged: (value) {
                                setState(() {
                                  _isOutside = value ?? false;
                                  _isSaved = false;
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Outside patient'),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _loadingDoctorInfo
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((_doctorSignatureUrl ?? '').isNotEmpty)
                                    SizedBox(
                                      height: 70,
                                      child: Image.network(
                                        _doctorSignatureUrl!,
                                        fit: BoxFit.contain,
                                        errorBuilder: (_, __, ___) =>
                                            const Text(
                                              'Signature preview unavailable',
                                            ),
                                      ),
                                    )
                                  else
                                    const Text('No signature uploaded yet.'),
                                  const SizedBox(height: 8),
                                  Text(
                                    _doctorName?.trim().isNotEmpty == true
                                        ? 'Doctor: ${_doctorName!.trim()}'
                                        : 'Doctor name unavailable',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _isSaving
                                  ? null
                                  : () =>
                                        _savePrescription(printAfterSave: true),
                              icon: _isSaving
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(Icons.save_outlined),
                              label: Text(
                                _isSaving
                                    ? 'Saving...'
                                    : _isSaved
                                    ? 'Saved'
                                    : 'Save & Print',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isSaved
                                    ? const Color(0xFF2563EB)
                                    : const Color(0xFF0369A1),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _clearForm,
                              icon: const Icon(
                                Icons.cleaning_services_outlined,
                              ),
                              label: const Text('Clear'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );

                if (isCompact) {
                  return Column(
                    children: [leftPane, const SizedBox(height: 12), rightPane],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: leftPane),
                    const SizedBox(width: 14),
                    Expanded(flex: 2, child: rightPane),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicineFormRow {
  _MedicineFormRow();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController mealTimeController = TextEditingController();

  Map<String, bool> times = {
    'Morning': true,
    'Afternoon': false,
    'Night': true,
  };

  bool isFourTimes = false;
  String mealTiming = 'after';

  void dispose() {
    nameController.dispose();
    durationController.dispose();
    mealTimeController.dispose();
  }
}
