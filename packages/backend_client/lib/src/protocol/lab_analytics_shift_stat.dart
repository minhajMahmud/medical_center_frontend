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

abstract class LabAnalyticsShiftStat implements _i1.SerializableModel {
  LabAnalyticsShiftStat._({
    required this.shift,
    required this.total,
    required this.submitted,
    required this.productivityPercent,
  });

  factory LabAnalyticsShiftStat({
    required String shift,
    required int total,
    required int submitted,
    required double productivityPercent,
  }) = _LabAnalyticsShiftStatImpl;

  factory LabAnalyticsShiftStat.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LabAnalyticsShiftStat(
      shift: jsonSerialization['shift'] as String,
      total: jsonSerialization['total'] as int,
      submitted: jsonSerialization['submitted'] as int,
      productivityPercent: (jsonSerialization['productivityPercent'] as num)
          .toDouble(),
    );
  }

  String shift;

  int total;

  int submitted;

  double productivityPercent;

  /// Returns a shallow copy of this [LabAnalyticsShiftStat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabAnalyticsShiftStat copyWith({
    String? shift,
    int? total,
    int? submitted,
    double? productivityPercent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabAnalyticsShiftStat',
      'shift': shift,
      'total': total,
      'submitted': submitted,
      'productivityPercent': productivityPercent,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LabAnalyticsShiftStatImpl extends LabAnalyticsShiftStat {
  _LabAnalyticsShiftStatImpl({
    required String shift,
    required int total,
    required int submitted,
    required double productivityPercent,
  }) : super._(
         shift: shift,
         total: total,
         submitted: submitted,
         productivityPercent: productivityPercent,
       );

  /// Returns a shallow copy of this [LabAnalyticsShiftStat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabAnalyticsShiftStat copyWith({
    String? shift,
    int? total,
    int? submitted,
    double? productivityPercent,
  }) {
    return LabAnalyticsShiftStat(
      shift: shift ?? this.shift,
      total: total ?? this.total,
      submitted: submitted ?? this.submitted,
      productivityPercent: productivityPercent ?? this.productivityPercent,
    );
  }
}
