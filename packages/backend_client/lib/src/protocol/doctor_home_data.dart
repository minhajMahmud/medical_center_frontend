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
import 'doctor_home_recent_item.dart' as _i2;
import 'doctor_home_reviewed_report.dart' as _i3;
import 'package:backend_client/src/protocol/protocol.dart' as _i4;

abstract class DoctorHomeData implements _i1.SerializableModel {
  DoctorHomeData._({
    required this.doctorName,
    required this.doctorDesignation,
    this.doctorProfilePictureUrl,
    required this.today,
    required this.todayPrescriptions,
    required this.yesterdayPrescriptions,
    required this.lastMonthPrescriptions,
    required this.previousMonthPrescriptions,
    required this.lastWeekPrescriptions,
    required this.previousWeekPrescriptions,
    this.nextFollowUpPatientName,
    this.nextFollowUpNote,
    required this.recent,
    required this.reviewedReports,
  });

  factory DoctorHomeData({
    required String doctorName,
    required String doctorDesignation,
    String? doctorProfilePictureUrl,
    required DateTime today,
    required int todayPrescriptions,
    required int yesterdayPrescriptions,
    required int lastMonthPrescriptions,
    required int previousMonthPrescriptions,
    required int lastWeekPrescriptions,
    required int previousWeekPrescriptions,
    String? nextFollowUpPatientName,
    String? nextFollowUpNote,
    required List<_i2.DoctorHomeRecentItem> recent,
    required List<_i3.DoctorHomeReviewedReport> reviewedReports,
  }) = _DoctorHomeDataImpl;

  factory DoctorHomeData.fromJson(Map<String, dynamic> jsonSerialization) {
    return DoctorHomeData(
      doctorName: jsonSerialization['doctorName'] as String,
      doctorDesignation: jsonSerialization['doctorDesignation'] as String,
      doctorProfilePictureUrl:
          jsonSerialization['doctorProfilePictureUrl'] as String?,
      today: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['today']),
      todayPrescriptions: jsonSerialization['todayPrescriptions'] as int,
      yesterdayPrescriptions:
          jsonSerialization['yesterdayPrescriptions'] as int,
      lastMonthPrescriptions:
          jsonSerialization['lastMonthPrescriptions'] as int,
      previousMonthPrescriptions:
          jsonSerialization['previousMonthPrescriptions'] as int,
      lastWeekPrescriptions: jsonSerialization['lastWeekPrescriptions'] as int,
      previousWeekPrescriptions:
          jsonSerialization['previousWeekPrescriptions'] as int,
      nextFollowUpPatientName:
          jsonSerialization['nextFollowUpPatientName'] as String?,
      nextFollowUpNote: jsonSerialization['nextFollowUpNote'] as String?,
      recent: _i4.Protocol().deserialize<List<_i2.DoctorHomeRecentItem>>(
        jsonSerialization['recent'],
      ),
      reviewedReports: _i4.Protocol()
          .deserialize<List<_i3.DoctorHomeReviewedReport>>(
            jsonSerialization['reviewedReports'],
          ),
    );
  }

  String doctorName;

  String doctorDesignation;

  String? doctorProfilePictureUrl;

  DateTime today;

  int todayPrescriptions;

  int yesterdayPrescriptions;

  int lastMonthPrescriptions;

  int previousMonthPrescriptions;

  int lastWeekPrescriptions;

  int previousWeekPrescriptions;

  String? nextFollowUpPatientName;

  String? nextFollowUpNote;

  List<_i2.DoctorHomeRecentItem> recent;

  List<_i3.DoctorHomeReviewedReport> reviewedReports;

  /// Returns a shallow copy of this [DoctorHomeData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DoctorHomeData copyWith({
    String? doctorName,
    String? doctorDesignation,
    String? doctorProfilePictureUrl,
    DateTime? today,
    int? todayPrescriptions,
    int? yesterdayPrescriptions,
    int? lastMonthPrescriptions,
    int? previousMonthPrescriptions,
    int? lastWeekPrescriptions,
    int? previousWeekPrescriptions,
    String? nextFollowUpPatientName,
    String? nextFollowUpNote,
    List<_i2.DoctorHomeRecentItem>? recent,
    List<_i3.DoctorHomeReviewedReport>? reviewedReports,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DoctorHomeData',
      'doctorName': doctorName,
      'doctorDesignation': doctorDesignation,
      if (doctorProfilePictureUrl != null)
        'doctorProfilePictureUrl': doctorProfilePictureUrl,
      'today': today.toJson(),
      'todayPrescriptions': todayPrescriptions,
      'yesterdayPrescriptions': yesterdayPrescriptions,
      'lastMonthPrescriptions': lastMonthPrescriptions,
      'previousMonthPrescriptions': previousMonthPrescriptions,
      'lastWeekPrescriptions': lastWeekPrescriptions,
      'previousWeekPrescriptions': previousWeekPrescriptions,
      if (nextFollowUpPatientName != null)
        'nextFollowUpPatientName': nextFollowUpPatientName,
      if (nextFollowUpNote != null) 'nextFollowUpNote': nextFollowUpNote,
      'recent': recent.toJson(valueToJson: (v) => v.toJson()),
      'reviewedReports': reviewedReports.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DoctorHomeDataImpl extends DoctorHomeData {
  _DoctorHomeDataImpl({
    required String doctorName,
    required String doctorDesignation,
    String? doctorProfilePictureUrl,
    required DateTime today,
    required int todayPrescriptions,
    required int yesterdayPrescriptions,
    required int lastMonthPrescriptions,
    required int previousMonthPrescriptions,
    required int lastWeekPrescriptions,
    required int previousWeekPrescriptions,
    String? nextFollowUpPatientName,
    String? nextFollowUpNote,
    required List<_i2.DoctorHomeRecentItem> recent,
    required List<_i3.DoctorHomeReviewedReport> reviewedReports,
  }) : super._(
         doctorName: doctorName,
         doctorDesignation: doctorDesignation,
         doctorProfilePictureUrl: doctorProfilePictureUrl,
         today: today,
         todayPrescriptions: todayPrescriptions,
         yesterdayPrescriptions: yesterdayPrescriptions,
         lastMonthPrescriptions: lastMonthPrescriptions,
         previousMonthPrescriptions: previousMonthPrescriptions,
         lastWeekPrescriptions: lastWeekPrescriptions,
         previousWeekPrescriptions: previousWeekPrescriptions,
         nextFollowUpPatientName: nextFollowUpPatientName,
         nextFollowUpNote: nextFollowUpNote,
         recent: recent,
         reviewedReports: reviewedReports,
       );

  /// Returns a shallow copy of this [DoctorHomeData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DoctorHomeData copyWith({
    String? doctorName,
    String? doctorDesignation,
    Object? doctorProfilePictureUrl = _Undefined,
    DateTime? today,
    int? todayPrescriptions,
    int? yesterdayPrescriptions,
    int? lastMonthPrescriptions,
    int? previousMonthPrescriptions,
    int? lastWeekPrescriptions,
    int? previousWeekPrescriptions,
    Object? nextFollowUpPatientName = _Undefined,
    Object? nextFollowUpNote = _Undefined,
    List<_i2.DoctorHomeRecentItem>? recent,
    List<_i3.DoctorHomeReviewedReport>? reviewedReports,
  }) {
    return DoctorHomeData(
      doctorName: doctorName ?? this.doctorName,
      doctorDesignation: doctorDesignation ?? this.doctorDesignation,
      doctorProfilePictureUrl: doctorProfilePictureUrl is String?
          ? doctorProfilePictureUrl
          : this.doctorProfilePictureUrl,
      today: today ?? this.today,
      todayPrescriptions: todayPrescriptions ?? this.todayPrescriptions,
      yesterdayPrescriptions:
          yesterdayPrescriptions ?? this.yesterdayPrescriptions,
      lastMonthPrescriptions:
          lastMonthPrescriptions ?? this.lastMonthPrescriptions,
      previousMonthPrescriptions:
          previousMonthPrescriptions ?? this.previousMonthPrescriptions,
      lastWeekPrescriptions:
          lastWeekPrescriptions ?? this.lastWeekPrescriptions,
      previousWeekPrescriptions:
          previousWeekPrescriptions ?? this.previousWeekPrescriptions,
      nextFollowUpPatientName: nextFollowUpPatientName is String?
          ? nextFollowUpPatientName
          : this.nextFollowUpPatientName,
      nextFollowUpNote: nextFollowUpNote is String?
          ? nextFollowUpNote
          : this.nextFollowUpNote,
      recent: recent ?? this.recent.map((e0) => e0.copyWith()).toList(),
      reviewedReports:
          reviewedReports ??
          this.reviewedReports.map((e0) => e0.copyWith()).toList(),
    );
  }
}
