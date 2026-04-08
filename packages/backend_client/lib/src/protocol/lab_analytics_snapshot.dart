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
import 'lab_analytics_daily_point.dart' as _i2;
import 'lab_analytics_test_count.dart' as _i3;
import 'lab_analytics_category_count.dart' as _i4;
import 'lab_analytics_shift_stat.dart' as _i5;
import 'package:backend_client/src/protocol/protocol.dart' as _i6;

abstract class LabAnalyticsSnapshot implements _i1.SerializableModel {
  LabAnalyticsSnapshot._({
    required this.totalResults,
    required this.submittedResults,
    required this.pendingResults,
    required this.urgentResults,
    required this.avgTatHours,
    required this.estimatedRevenue,
    required this.submittedRevenue,
    this.fromDate,
    this.toDateExclusive,
    required this.patientType,
    required this.dailyTrend,
    required this.topTests,
    required this.categoryDistribution,
    required this.shiftProductivity,
  });

  factory LabAnalyticsSnapshot({
    required int totalResults,
    required int submittedResults,
    required int pendingResults,
    required int urgentResults,
    required double avgTatHours,
    required double estimatedRevenue,
    required double submittedRevenue,
    DateTime? fromDate,
    DateTime? toDateExclusive,
    required String patientType,
    required List<_i2.LabAnalyticsDailyPoint> dailyTrend,
    required List<_i3.LabAnalyticsTestCount> topTests,
    required List<_i4.LabAnalyticsCategoryCount> categoryDistribution,
    required List<_i5.LabAnalyticsShiftStat> shiftProductivity,
  }) = _LabAnalyticsSnapshotImpl;

  factory LabAnalyticsSnapshot.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LabAnalyticsSnapshot(
      totalResults: jsonSerialization['totalResults'] as int,
      submittedResults: jsonSerialization['submittedResults'] as int,
      pendingResults: jsonSerialization['pendingResults'] as int,
      urgentResults: jsonSerialization['urgentResults'] as int,
      avgTatHours: (jsonSerialization['avgTatHours'] as num).toDouble(),
      estimatedRevenue: (jsonSerialization['estimatedRevenue'] as num)
          .toDouble(),
      submittedRevenue: (jsonSerialization['submittedRevenue'] as num)
          .toDouble(),
      fromDate: jsonSerialization['fromDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['fromDate']),
      toDateExclusive: jsonSerialization['toDateExclusive'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['toDateExclusive'],
            ),
      patientType: jsonSerialization['patientType'] as String,
      dailyTrend: _i6.Protocol().deserialize<List<_i2.LabAnalyticsDailyPoint>>(
        jsonSerialization['dailyTrend'],
      ),
      topTests: _i6.Protocol().deserialize<List<_i3.LabAnalyticsTestCount>>(
        jsonSerialization['topTests'],
      ),
      categoryDistribution: _i6.Protocol()
          .deserialize<List<_i4.LabAnalyticsCategoryCount>>(
            jsonSerialization['categoryDistribution'],
          ),
      shiftProductivity: _i6.Protocol()
          .deserialize<List<_i5.LabAnalyticsShiftStat>>(
            jsonSerialization['shiftProductivity'],
          ),
    );
  }

  int totalResults;

  int submittedResults;

  int pendingResults;

  int urgentResults;

  double avgTatHours;

  double estimatedRevenue;

  double submittedRevenue;

  DateTime? fromDate;

  DateTime? toDateExclusive;

  String patientType;

  List<_i2.LabAnalyticsDailyPoint> dailyTrend;

  List<_i3.LabAnalyticsTestCount> topTests;

  List<_i4.LabAnalyticsCategoryCount> categoryDistribution;

  List<_i5.LabAnalyticsShiftStat> shiftProductivity;

  /// Returns a shallow copy of this [LabAnalyticsSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabAnalyticsSnapshot copyWith({
    int? totalResults,
    int? submittedResults,
    int? pendingResults,
    int? urgentResults,
    double? avgTatHours,
    double? estimatedRevenue,
    double? submittedRevenue,
    DateTime? fromDate,
    DateTime? toDateExclusive,
    String? patientType,
    List<_i2.LabAnalyticsDailyPoint>? dailyTrend,
    List<_i3.LabAnalyticsTestCount>? topTests,
    List<_i4.LabAnalyticsCategoryCount>? categoryDistribution,
    List<_i5.LabAnalyticsShiftStat>? shiftProductivity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabAnalyticsSnapshot',
      'totalResults': totalResults,
      'submittedResults': submittedResults,
      'pendingResults': pendingResults,
      'urgentResults': urgentResults,
      'avgTatHours': avgTatHours,
      'estimatedRevenue': estimatedRevenue,
      'submittedRevenue': submittedRevenue,
      if (fromDate != null) 'fromDate': fromDate?.toJson(),
      if (toDateExclusive != null) 'toDateExclusive': toDateExclusive?.toJson(),
      'patientType': patientType,
      'dailyTrend': dailyTrend.toJson(valueToJson: (v) => v.toJson()),
      'topTests': topTests.toJson(valueToJson: (v) => v.toJson()),
      'categoryDistribution': categoryDistribution.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'shiftProductivity': shiftProductivity.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LabAnalyticsSnapshotImpl extends LabAnalyticsSnapshot {
  _LabAnalyticsSnapshotImpl({
    required int totalResults,
    required int submittedResults,
    required int pendingResults,
    required int urgentResults,
    required double avgTatHours,
    required double estimatedRevenue,
    required double submittedRevenue,
    DateTime? fromDate,
    DateTime? toDateExclusive,
    required String patientType,
    required List<_i2.LabAnalyticsDailyPoint> dailyTrend,
    required List<_i3.LabAnalyticsTestCount> topTests,
    required List<_i4.LabAnalyticsCategoryCount> categoryDistribution,
    required List<_i5.LabAnalyticsShiftStat> shiftProductivity,
  }) : super._(
         totalResults: totalResults,
         submittedResults: submittedResults,
         pendingResults: pendingResults,
         urgentResults: urgentResults,
         avgTatHours: avgTatHours,
         estimatedRevenue: estimatedRevenue,
         submittedRevenue: submittedRevenue,
         fromDate: fromDate,
         toDateExclusive: toDateExclusive,
         patientType: patientType,
         dailyTrend: dailyTrend,
         topTests: topTests,
         categoryDistribution: categoryDistribution,
         shiftProductivity: shiftProductivity,
       );

  /// Returns a shallow copy of this [LabAnalyticsSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabAnalyticsSnapshot copyWith({
    int? totalResults,
    int? submittedResults,
    int? pendingResults,
    int? urgentResults,
    double? avgTatHours,
    double? estimatedRevenue,
    double? submittedRevenue,
    Object? fromDate = _Undefined,
    Object? toDateExclusive = _Undefined,
    String? patientType,
    List<_i2.LabAnalyticsDailyPoint>? dailyTrend,
    List<_i3.LabAnalyticsTestCount>? topTests,
    List<_i4.LabAnalyticsCategoryCount>? categoryDistribution,
    List<_i5.LabAnalyticsShiftStat>? shiftProductivity,
  }) {
    return LabAnalyticsSnapshot(
      totalResults: totalResults ?? this.totalResults,
      submittedResults: submittedResults ?? this.submittedResults,
      pendingResults: pendingResults ?? this.pendingResults,
      urgentResults: urgentResults ?? this.urgentResults,
      avgTatHours: avgTatHours ?? this.avgTatHours,
      estimatedRevenue: estimatedRevenue ?? this.estimatedRevenue,
      submittedRevenue: submittedRevenue ?? this.submittedRevenue,
      fromDate: fromDate is DateTime? ? fromDate : this.fromDate,
      toDateExclusive: toDateExclusive is DateTime?
          ? toDateExclusive
          : this.toDateExclusive,
      patientType: patientType ?? this.patientType,
      dailyTrend:
          dailyTrend ?? this.dailyTrend.map((e0) => e0.copyWith()).toList(),
      topTests: topTests ?? this.topTests.map((e0) => e0.copyWith()).toList(),
      categoryDistribution:
          categoryDistribution ??
          this.categoryDistribution.map((e0) => e0.copyWith()).toList(),
      shiftProductivity:
          shiftProductivity ??
          this.shiftProductivity.map((e0) => e0.copyWith()).toList(),
    );
  }
}
