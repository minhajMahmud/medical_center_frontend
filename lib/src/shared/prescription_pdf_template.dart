import 'dart:typed_data';

import 'package:bangla_pdf_fixer/bangla_pdf_fixer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionPdfMedicine {
  const PrescriptionPdfMedicine({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.duration,
    required this.instructions,
  });

  final String name;
  final String dosage;
  final String frequency;
  final String duration;
  final String instructions;
}

class PrescriptionPdfPayload {
  const PrescriptionPdfPayload({
    required this.patientName,
    required this.mobile,
    required this.age,
    required this.gender,
    required this.bloodGroup,
    required this.patientId,
    required this.date,
    required this.chiefComplaint,
    required this.onExamination,
    required this.advice,
    required this.investigation,
    required this.nextVisit,
    required this.medicines,
    this.doctorName,
    this.doctorSignatureBytes,
  });

  final String patientName;
  final String mobile;
  final String age;
  final String gender;
  final String bloodGroup;
  final String patientId;
  final String date;
  final String chiefComplaint;
  final String onExamination;
  final String advice;
  final String investigation;
  final String nextVisit;
  final List<PrescriptionPdfMedicine> medicines;
  final String? doctorName;
  final Uint8List? doctorSignatureBytes;
}

final _colNavy = PdfColor.fromHex('1B3C6B');
final _colBlue = PdfColor.fromHex('1D5FAB');
final _colLightBg = PdfColor.fromHex('E8F0FB');
final _colTableHeader = PdfColor.fromHex('C8DBEF');
final _colRowAlt = PdfColor.fromHex('F5F9FF');
final _colDivider = PdfColor.fromHex('CBD5E1');
final _colLabel = PdfColor.fromHex('374151');
final _colMuted = PdfColor.fromHex('6B7280');
final _colTeal = PdfColor.fromHex('0E7490');

Future<Uint8List> buildUnifiedPrescriptionPdf(
  PrescriptionPdfPayload payload,
) async {
  await BanglaFontManager().initialize();

  final pdf = pw.Document();
  final englishFont = await _loadFont('assets/fonts/OpenSans-VariableFont.ttf');
  final logo = await _loadImage('assets/images/nstu_logo.jpg');
  final heading = await _loadImage(
    'assets/images/prescription_download_heading.png',
  );

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      build: (_) => [
        _buildHeader(logo: logo, heading: heading, englishFont: englishFont),
        pw.SizedBox(height: 8),
        pw.Divider(color: _colDivider, thickness: 1),
        pw.SizedBox(height: 6),
        _buildPatientBar(payload, englishFont),
        pw.SizedBox(height: 8),
        pw.Divider(color: _colDivider, thickness: 1),
        pw.SizedBox(height: 10),
        _buildBody(payload, englishFont),
        pw.SizedBox(height: 18),
        pw.Divider(color: _colDivider, thickness: .7),
        pw.SizedBox(height: 8),
        _buildFooter(payload, englishFont),
      ],
    ),
  );

  return pdf.save();
}

Future<pw.Font?> _loadFont(String assetPath) async {
  try {
    final data = await rootBundle.load(assetPath);
    return pw.Font.ttf(data);
  } catch (_) {
    return null;
  }
}

Future<pw.MemoryImage?> _loadImage(String assetPath) async {
  try {
    final bytes = (await rootBundle.load(assetPath)).buffer.asUint8List();
    return pw.MemoryImage(bytes);
  } catch (_) {
    return null;
  }
}

bool _hasBangla(String value) => RegExp(r'[\u0980-\u09FF]').hasMatch(value);

String _safeValue(String value) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? '-' : trimmed;
}

pw.Widget _styledText(
  String value, {
  pw.Font? englishFont,
  double fontSize = 10,
  PdfColor color = PdfColors.black,
  bool bold = false,
  pw.TextAlign textAlign = pw.TextAlign.left,
  double? lineSpacing,
}) {
  final safe = _safeValue(value);
  if (_hasBangla(safe)) {
    return pw.Align(
      alignment: _mapAlign(textAlign),
      child: BanglaText(safe, fontSize: fontSize, color: color),
    );
  }

  return pw.Text(
    safe,
    textAlign: textAlign,
    style: pw.TextStyle(
      font: englishFont,
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
      lineSpacing: lineSpacing,
    ),
  );
}

pw.Alignment _mapAlign(pw.TextAlign align) {
  switch (align) {
    case pw.TextAlign.center:
      return pw.Alignment.center;
    case pw.TextAlign.right:
      return pw.Alignment.centerRight;
    default:
      return pw.Alignment.centerLeft;
  }
}

pw.Widget _buildHeader({
  required pw.MemoryImage? logo,
  required pw.MemoryImage? heading,
  required pw.Font? englishFont,
}) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      if (logo != null)
        pw.SizedBox(
          width: 64,
          height: 64,
          child: pw.Image(logo, fit: pw.BoxFit.contain),
        )
      else
        pw.SizedBox(width: 64, height: 64),
      pw.SizedBox(width: 14),
      pw.Expanded(
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: heading != null
              ? pw.SizedBox(
                  height: 72,
                  child: pw.Image(heading, fit: pw.BoxFit.contain),
                )
              : pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    BanglaText('মেডিকেল সেন্টার', fontSize: 18),
                    pw.SizedBox(height: 2),
                    BanglaText(
                      'নোয়াখালী বিজ্ঞান ও প্রযুক্তি বিশ্ববিদ্যালয়',
                      fontSize: 14,
                    ),
                    pw.SizedBox(height: 4),
                    _styledText(
                      'Noakhali Science and Technology University',
                      englishFont: englishFont,
                      fontSize: 15,
                      color: _colBlue,
                      bold: true,
                      textAlign: pw.TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    ],
  );
}

pw.Widget _buildPatientBar(
  PrescriptionPdfPayload payload,
  pw.Font? englishFont,
) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      color: _colLightBg,
      borderRadius: pw.BorderRadius.circular(5),
    ),
    padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: pw.Row(
      children: [
        pw.Expanded(
          flex: 5,
          child: _infoCell('PATIENT', payload.patientName, englishFont),
        ),
        _infoDivider(),
        pw.Expanded(
          flex: 3,
          child: _infoCell('MOBILE', payload.mobile, englishFont),
        ),
        _infoDivider(),
        pw.Expanded(flex: 2, child: _infoCell('AGE', payload.age, englishFont)),
        _infoDivider(),
        pw.Expanded(
          flex: 2,
          child: _infoCell('GENDER', payload.gender, englishFont),
        ),
        _infoDivider(),
        pw.Expanded(
          flex: 2,
          child: _infoCell('BLOOD', payload.bloodGroup, englishFont),
        ),
        _infoDivider(),
        pw.Expanded(
          flex: 3,
          child: _infoCell('DATE', payload.date, englishFont),
        ),
      ],
    ),
  );
}

pw.Widget _infoDivider() => pw.Container(
  width: 1,
  height: 30,
  margin: const pw.EdgeInsets.symmetric(horizontal: 6),
  decoration: pw.BoxDecoration(
    border: pw.Border(left: pw.BorderSide(color: _colDivider, width: 1)),
  ),
);

pw.Widget _infoCell(String label, String value, pw.Font? englishFont) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        label,
        style: pw.TextStyle(font: englishFont, fontSize: 7.5, color: _colMuted),
      ),
      pw.SizedBox(height: 2),
      _styledText(
        value,
        englishFont: englishFont,
        fontSize: 10,
        bold: true,
        color: _colNavy,
      ),
    ],
  );
}

pw.Widget _buildBody(PrescriptionPdfPayload payload, pw.Font? englishFont) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(
        width: 168,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _sectionBox(
              'CHIEF COMPLAINT (C/C)',
              payload.chiefComplaint,
              englishFont,
            ),
            pw.SizedBox(height: 10),
            _sectionBox(
              'ON EXAMINATION (O/E)',
              payload.onExamination,
              englishFont,
            ),
            pw.SizedBox(height: 10),
            _sectionBox('ADVICE', payload.advice, englishFont),
            pw.SizedBox(height: 10),
            _sectionBox(
              'INVESTIGATION (INV)',
              payload.investigation,
              englishFont,
            ),
          ],
        ),
      ),
      pw.Container(
        width: 1,
        margin: const pw.EdgeInsets.symmetric(horizontal: 12),
        decoration: pw.BoxDecoration(
          border: pw.Border(left: pw.BorderSide(color: _colDivider, width: 1)),
        ),
      ),
      pw.Expanded(child: _rxSection(payload.medicines, englishFont)),
    ],
  );
}

pw.Widget _sectionBox(String title, String content, pw.Font? englishFont) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        decoration: pw.BoxDecoration(
          color: _colTableHeader,
          borderRadius: const pw.BorderRadius.only(
            topLeft: pw.Radius.circular(3),
            topRight: pw.Radius.circular(3),
          ),
        ),
        padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: pw.Text(
          title,
          style: pw.TextStyle(
            font: englishFont,
            fontSize: 8,
            fontWeight: pw.FontWeight.bold,
            color: _colNavy,
          ),
        ),
      ),
      pw.Container(
        width: double.infinity,
        decoration: pw.BoxDecoration(
          border: pw.Border(
            left: pw.BorderSide(color: _colDivider, width: .6),
            right: pw.BorderSide(color: _colDivider, width: .6),
            bottom: pw.BorderSide(color: _colDivider, width: .6),
          ),
        ),
        padding: const pw.EdgeInsets.all(6),
        child: _styledText(
          content,
          englishFont: englishFont,
          fontSize: 10,
          color: _colLabel,
          lineSpacing: 2.5,
        ),
      ),
    ],
  );
}

pw.Widget _rxSection(
  List<PrescriptionPdfMedicine> medicines,
  pw.Font? englishFont,
) {
  final items = medicines.isEmpty
      ? const [
          PrescriptionPdfMedicine(
            name: 'No medication prescribed',
            dosage: '-',
            frequency: '-',
            duration: '-',
            instructions: '-',
          ),
        ]
      : medicines;

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        'Rx',
        style: pw.TextStyle(
          font: englishFont,
          fontSize: 30,
          fontStyle: pw.FontStyle.italic,
          fontWeight: pw.FontWeight.bold,
          color: _colBlue,
        ),
      ),
      pw.SizedBox(height: 8),
      pw.Table(
        columnWidths: const {
          0: pw.FlexColumnWidth(4),
          1: pw.FlexColumnWidth(2.2),
          2: pw.FlexColumnWidth(2.5),
          3: pw.FlexColumnWidth(2),
          4: pw.FlexColumnWidth(3),
        },
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
        children: [
          pw.TableRow(
            decoration: pw.BoxDecoration(color: _colTableHeader),
            children:
                ['MEDICINE', 'DOSAGE', 'FREQUENCY', 'DURATION', 'INSTRUCTIONS']
                    .map(
                      (title) => pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: pw.Text(
                          title,
                          style: pw.TextStyle(
                            font: englishFont,
                            fontSize: 8,
                            fontWeight: pw.FontWeight.bold,
                            color: _colNavy,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          ...items.asMap().entries.map(
            (entry) => pw.TableRow(
              decoration: pw.BoxDecoration(
                color: entry.key.isOdd ? _colRowAlt : PdfColors.white,
              ),
              children: [
                _tableCell(entry.value.name, englishFont),
                _tableCell(entry.value.dosage, englishFont),
                _tableCell(entry.value.frequency, englishFont),
                _tableCell(entry.value.duration, englishFont),
                _tableCell(entry.value.instructions, englishFont, muted: true),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

pw.Widget _tableCell(String value, pw.Font? englishFont, {bool muted = false}) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: _styledText(
      value,
      englishFont: englishFont,
      fontSize: 9.5,
      color: muted ? _colMuted : _colLabel,
    ),
  );
}

pw.Widget _buildFooter(PrescriptionPdfPayload payload, pw.Font? englishFont) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    crossAxisAlignment: pw.CrossAxisAlignment.end,
    children: [
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Patient ID: ${_safeValue(payload.patientId)}',
            style: pw.TextStyle(
              font: englishFont,
              fontSize: 10,
              color: _colMuted,
            ),
          ),
          if (payload.nextVisit.trim().isNotEmpty &&
              payload.nextVisit.trim() != '-')
            pw.Text(
              'Next Visit: ${payload.nextVisit.trim()}',
              style: pw.TextStyle(
                font: englishFont,
                fontSize: 10,
                color: _colTeal,
              ),
            ),
        ],
      ),
      pw.SizedBox(
        width: 150,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            if (payload.doctorSignatureBytes != null)
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 4),
                child: pw.Image(
                  pw.MemoryImage(payload.doctorSignatureBytes!),
                  width: 120,
                  height: 45,
                  fit: pw.BoxFit.contain,
                ),
              ),
            pw.Container(
              height: 1,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(color: _colNavy, width: 1),
                ),
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              (payload.doctorName ?? '').trim().isEmpty
                  ? 'Authorised Signature'
                  : payload.doctorName!.trim(),
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                font: englishFont,
                fontSize: 9,
                color: _colLabel,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
