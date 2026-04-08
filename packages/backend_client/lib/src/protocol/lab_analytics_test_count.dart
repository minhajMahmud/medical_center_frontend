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

abstract class LabAnalyticsTestCount implements _i1.SerializableModel {
  LabAnalyticsTestCount._({
    required this.testName,
    required this.count,
  });

  factory LabAnalyticsTestCount({
    required String testName,
    required int count,
  }) = _LabAnalyticsTestCountImpl;

  factory LabAnalyticsTestCount.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LabAnalyticsTestCount(
      testName: jsonSerialization['testName'] as String,
      count: jsonSerialization['count'] as int,
    );
  }

  String testName;

  int count;

  /// Returns a shallow copy of this [LabAnalyticsTestCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabAnalyticsTestCount copyWith({
    String? testName,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabAnalyticsTestCount',
      'testName': testName,
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LabAnalyticsTestCountImpl extends LabAnalyticsTestCount {
  _LabAnalyticsTestCountImpl({
    required String testName,
    required int count,
  }) : super._(
         testName: testName,
         count: count,
       );

  /// Returns a shallow copy of this [LabAnalyticsTestCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabAnalyticsTestCount copyWith({
    String? testName,
    int? count,
  }) {
    return LabAnalyticsTestCount(
      testName: testName ?? this.testName,
      count: count ?? this.count,
    );
  }
}
