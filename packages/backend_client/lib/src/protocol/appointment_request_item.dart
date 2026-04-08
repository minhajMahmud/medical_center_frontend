/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AppointmentRequestItem implements _i1.SerializableModel {
  AppointmentRequestItem._({
    required this.appointmentRequestId,
    required this.patientId,
    required this.doctorId,
    required this.patientName,
    required this.patientPhone,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.reason,
    this.notes,
    required this.mode,
    required this.urgent,
    required this.status,
    this.declineReason,
    required this.createdAt,
    this.actedAt,
  });

  factory AppointmentRequestItem({
    required int appointmentRequestId,
    required int patientId,
    required int doctorId,
    required String patientName,
    required String patientPhone,
    required DateTime appointmentDate,
    required String appointmentTime,
    required String reason,
    String? notes,
    required String mode,
    required bool urgent,
    required String status,
    String? declineReason,
    required DateTime createdAt,
    DateTime? actedAt,
  }) = _AppointmentRequestItemImpl;

  factory AppointmentRequestItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AppointmentRequestItem(
      appointmentRequestId: jsonSerialization['appointmentRequestId'] as int,
      patientId: jsonSerialization['patientId'] as int,
      doctorId: jsonSerialization['doctorId'] as int,
      patientName: jsonSerialization['patientName'] as String,
      patientPhone: jsonSerialization['patientPhone'] as String,
      appointmentDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['appointmentDate'],
      ),
      appointmentTime: jsonSerialization['appointmentTime'] as String,
      reason: jsonSerialization['reason'] as String,
      notes: jsonSerialization['notes'] as String?,
      mode: jsonSerialization['mode'] as String,
      urgent: jsonSerialization['urgent'] as bool,
      status: jsonSerialization['status'] as String,
      declineReason: jsonSerialization['declineReason'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      actedAt: jsonSerialization['actedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['actedAt']),
    );
  }

  int appointmentRequestId;

  int patientId;

  int doctorId;

  String patientName;

  String patientPhone;

  DateTime appointmentDate;

  String appointmentTime;

  String reason;

  String? notes;

  String mode;

  bool urgent;

  String status;

  String? declineReason;

  DateTime createdAt;

  DateTime? actedAt;

  /// Returns a shallow copy of this [AppointmentRequestItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppointmentRequestItem copyWith({
    int? appointmentRequestId,
    int? patientId,
    int? doctorId,
    String? patientName,
    String? patientPhone,
    DateTime? appointmentDate,
    String? appointmentTime,
    String? reason,
    String? notes,
    String? mode,
    bool? urgent,
    String? status,
    String? declineReason,
    DateTime? createdAt,
    DateTime? actedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppointmentRequestItem',
      'appointmentRequestId': appointmentRequestId,
      'patientId': patientId,
      'doctorId': doctorId,
      'patientName': patientName,
      'patientPhone': patientPhone,
      'appointmentDate': appointmentDate.toJson(),
      'appointmentTime': appointmentTime,
      'reason': reason,
      if (notes != null) 'notes': notes,
      'mode': mode,
      'urgent': urgent,
      'status': status,
      if (declineReason != null) 'declineReason': declineReason,
      'createdAt': createdAt.toJson(),
      if (actedAt != null) 'actedAt': actedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentRequestItemImpl extends AppointmentRequestItem {
  _AppointmentRequestItemImpl({
    required int appointmentRequestId,
    required int patientId,
    required int doctorId,
    required String patientName,
    required String patientPhone,
    required DateTime appointmentDate,
    required String appointmentTime,
    required String reason,
    String? notes,
    required String mode,
    required bool urgent,
    required String status,
    String? declineReason,
    required DateTime createdAt,
    DateTime? actedAt,
  }) : super._(
         appointmentRequestId: appointmentRequestId,
         patientId: patientId,
         doctorId: doctorId,
         patientName: patientName,
         patientPhone: patientPhone,
         appointmentDate: appointmentDate,
         appointmentTime: appointmentTime,
         reason: reason,
         notes: notes,
         mode: mode,
         urgent: urgent,
         status: status,
         declineReason: declineReason,
         createdAt: createdAt,
         actedAt: actedAt,
       );

  /// Returns a shallow copy of this [AppointmentRequestItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppointmentRequestItem copyWith({
    int? appointmentRequestId,
    int? patientId,
    int? doctorId,
    String? patientName,
    String? patientPhone,
    DateTime? appointmentDate,
    String? appointmentTime,
    String? reason,
    Object? notes = _Undefined,
    String? mode,
    bool? urgent,
    String? status,
    Object? declineReason = _Undefined,
    DateTime? createdAt,
    Object? actedAt = _Undefined,
  }) {
    return AppointmentRequestItem(
      appointmentRequestId: appointmentRequestId ?? this.appointmentRequestId,
      patientId: patientId ?? this.patientId,
      doctorId: doctorId ?? this.doctorId,
      patientName: patientName ?? this.patientName,
      patientPhone: patientPhone ?? this.patientPhone,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      reason: reason ?? this.reason,
      notes: notes is String? ? notes : this.notes,
      mode: mode ?? this.mode,
      urgent: urgent ?? this.urgent,
      status: status ?? this.status,
      declineReason: declineReason is String?
          ? declineReason
          : this.declineReason,
      createdAt: createdAt ?? this.createdAt,
      actedAt: actedAt is DateTime? ? actedAt : this.actedAt,
    );
  }
}
