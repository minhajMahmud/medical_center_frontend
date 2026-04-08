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

abstract class StaffInfo implements _i1.SerializableModel {
  StaffInfo._({
    this.userId,
    required this.name,
    required this.phone,
    this.designation,
    this.profilePictureUrl,
    this.qualification,
  });

  factory StaffInfo({
    int? userId,
    required String name,
    required String phone,
    String? designation,
    String? profilePictureUrl,
    String? qualification,
  }) = _StaffInfoImpl;

  factory StaffInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return StaffInfo(
      userId: jsonSerialization['userId'] as int?,
      name: jsonSerialization['name'] as String,
      phone: jsonSerialization['phone'] as String,
      designation: jsonSerialization['designation'] as String?,
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
      qualification: jsonSerialization['qualification'] as String?,
    );
  }

  int? userId;

  String name;

  String phone;

  String? designation;

  String? profilePictureUrl;

  String? qualification;

  /// Returns a shallow copy of this [StaffInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StaffInfo copyWith({
    int? userId,
    String? name,
    String? phone,
    String? designation,
    String? profilePictureUrl,
    String? qualification,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StaffInfo',
      if (userId != null) 'userId': userId,
      'name': name,
      'phone': phone,
      if (designation != null) 'designation': designation,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      if (qualification != null) 'qualification': qualification,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StaffInfoImpl extends StaffInfo {
  _StaffInfoImpl({
    int? userId,
    required String name,
    required String phone,
    String? designation,
    String? profilePictureUrl,
    String? qualification,
  }) : super._(
         userId: userId,
         name: name,
         phone: phone,
         designation: designation,
         profilePictureUrl: profilePictureUrl,
         qualification: qualification,
       );

  /// Returns a shallow copy of this [StaffInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StaffInfo copyWith({
    Object? userId = _Undefined,
    String? name,
    String? phone,
    Object? designation = _Undefined,
    Object? profilePictureUrl = _Undefined,
    Object? qualification = _Undefined,
  }) {
    return StaffInfo(
      userId: userId is int? ? userId : this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      designation: designation is String? ? designation : this.designation,
      profilePictureUrl: profilePictureUrl is String?
          ? profilePictureUrl
          : this.profilePictureUrl,
      qualification: qualification is String?
          ? qualification
          : this.qualification,
    );
  }
}
