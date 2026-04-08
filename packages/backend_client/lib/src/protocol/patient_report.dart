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

abstract class PatientReportDto implements _i1.SerializableModel {
  PatientReportDto._({
    required this.id,
    required this.testName,
    required this.date,
    required this.isUploaded,
    this.fileUrl,
    this.doctorNotes,
    this.reviewAction,
  });

  factory PatientReportDto({
    required int id,
    required String testName,
    required DateTime date,
    required bool isUploaded,
    String? fileUrl,
    String? doctorNotes,
    String? reviewAction,
  }) = _PatientReportDtoImpl;

  factory PatientReportDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return PatientReportDto(
      id: jsonSerialization['id'] as int,
      testName: jsonSerialization['testName'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      isUploaded: jsonSerialization['isUploaded'] as bool,
      fileUrl: jsonSerialization['fileUrl'] as String?,
      doctorNotes: jsonSerialization['doctorNotes'] as String?,
      reviewAction: jsonSerialization['reviewAction'] as String?,
    );
  }

  int id;

  String testName;

  DateTime date;

  bool isUploaded;

  String? fileUrl;

  String? doctorNotes;

  String? reviewAction;

  /// Returns a shallow copy of this [PatientReportDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PatientReportDto copyWith({
    int? id,
    String? testName,
    DateTime? date,
    bool? isUploaded,
    String? fileUrl,
    String? doctorNotes,
    String? reviewAction,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PatientReportDto',
      'id': id,
      'testName': testName,
      'date': date.toJson(),
      'isUploaded': isUploaded,
      if (fileUrl != null) 'fileUrl': fileUrl,
      if (doctorNotes != null) 'doctorNotes': doctorNotes,
      if (reviewAction != null) 'reviewAction': reviewAction,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PatientReportDtoImpl extends PatientReportDto {
  _PatientReportDtoImpl({
    required int id,
    required String testName,
    required DateTime date,
    required bool isUploaded,
    String? fileUrl,
    String? doctorNotes,
    String? reviewAction,
  }) : super._(
         id: id,
         testName: testName,
         date: date,
         isUploaded: isUploaded,
         fileUrl: fileUrl,
         doctorNotes: doctorNotes,
         reviewAction: reviewAction,
       );

  /// Returns a shallow copy of this [PatientReportDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PatientReportDto copyWith({
    int? id,
    String? testName,
    DateTime? date,
    bool? isUploaded,
    Object? fileUrl = _Undefined,
    Object? doctorNotes = _Undefined,
    Object? reviewAction = _Undefined,
  }) {
    return PatientReportDto(
      id: id ?? this.id,
      testName: testName ?? this.testName,
      date: date ?? this.date,
      isUploaded: isUploaded ?? this.isUploaded,
      fileUrl: fileUrl is String? ? fileUrl : this.fileUrl,
      doctorNotes: doctorNotes is String? ? doctorNotes : this.doctorNotes,
      reviewAction: reviewAction is String? ? reviewAction : this.reviewAction,
    );
  }
}
