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

abstract class LabAnalyticsDailyPoint implements _i1.SerializableModel {
  LabAnalyticsDailyPoint._({
    required this.day,
    required this.total,
    required this.submitted,
  });

  factory LabAnalyticsDailyPoint({
    required DateTime day,
    required int total,
    required int submitted,
  }) = _LabAnalyticsDailyPointImpl;

  factory LabAnalyticsDailyPoint.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LabAnalyticsDailyPoint(
      day: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['day']),
      total: jsonSerialization['total'] as int,
      submitted: jsonSerialization['submitted'] as int,
    );
  }

  DateTime day;

  int total;

  int submitted;

  /// Returns a shallow copy of this [LabAnalyticsDailyPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabAnalyticsDailyPoint copyWith({
    DateTime? day,
    int? total,
    int? submitted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabAnalyticsDailyPoint',
      'day': day.toJson(),
      'total': total,
      'submitted': submitted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LabAnalyticsDailyPointImpl extends LabAnalyticsDailyPoint {
  _LabAnalyticsDailyPointImpl({
    required DateTime day,
    required int total,
    required int submitted,
  }) : super._(
         day: day,
         total: total,
         submitted: submitted,
       );

  /// Returns a shallow copy of this [LabAnalyticsDailyPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabAnalyticsDailyPoint copyWith({
    DateTime? day,
    int? total,
    int? submitted,
  }) {
    return LabAnalyticsDailyPoint(
      day: day ?? this.day,
      total: total ?? this.total,
      submitted: submitted ?? this.submitted,
    );
  }
}
