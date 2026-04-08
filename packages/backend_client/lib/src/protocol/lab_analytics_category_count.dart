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

abstract class LabAnalyticsCategoryCount implements _i1.SerializableModel {
  LabAnalyticsCategoryCount._({
    required this.category,
    required this.count,
  });

  factory LabAnalyticsCategoryCount({
    required String category,
    required int count,
  }) = _LabAnalyticsCategoryCountImpl;

  factory LabAnalyticsCategoryCount.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LabAnalyticsCategoryCount(
      category: jsonSerialization['category'] as String,
      count: jsonSerialization['count'] as int,
    );
  }

  String category;

  int count;

  /// Returns a shallow copy of this [LabAnalyticsCategoryCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabAnalyticsCategoryCount copyWith({
    String? category,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabAnalyticsCategoryCount',
      'category': category,
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LabAnalyticsCategoryCountImpl extends LabAnalyticsCategoryCount {
  _LabAnalyticsCategoryCountImpl({
    required String category,
    required int count,
  }) : super._(
         category: category,
         count: count,
       );

  /// Returns a shallow copy of this [LabAnalyticsCategoryCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabAnalyticsCategoryCount copyWith({
    String? category,
    int? count,
  }) {
    return LabAnalyticsCategoryCount(
      category: category ?? this.category,
      count: count ?? this.count,
    );
  }
}
