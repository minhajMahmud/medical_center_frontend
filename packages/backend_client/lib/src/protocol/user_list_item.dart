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

abstract class UserListItem implements _i1.SerializableModel {
  UserListItem._({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    required this.active,
    this.profilePictureUrl,
  });

  factory UserListItem({
    required String userId,
    required String name,
    required String email,
    required String role,
    String? phone,
    required bool active,
    String? profilePictureUrl,
  }) = _UserListItemImpl;

  factory UserListItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserListItem(
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      phone: jsonSerialization['phone'] as String?,
      active: jsonSerialization['active'] as bool,
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
    );
  }

  String userId;

  String name;

  String email;

  String role;

  String? phone;

  bool active;

  String? profilePictureUrl;

  /// Returns a shallow copy of this [UserListItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserListItem copyWith({
    String? userId,
    String? name,
    String? email,
    String? role,
    String? phone,
    bool? active,
    String? profilePictureUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserListItem',
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      if (phone != null) 'phone': phone,
      'active': active,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserListItemImpl extends UserListItem {
  _UserListItemImpl({
    required String userId,
    required String name,
    required String email,
    required String role,
    String? phone,
    required bool active,
    String? profilePictureUrl,
  }) : super._(
         userId: userId,
         name: name,
         email: email,
         role: role,
         phone: phone,
         active: active,
         profilePictureUrl: profilePictureUrl,
       );

  /// Returns a shallow copy of this [UserListItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserListItem copyWith({
    String? userId,
    String? name,
    String? email,
    String? role,
    Object? phone = _Undefined,
    bool? active,
    Object? profilePictureUrl = _Undefined,
  }) {
    return UserListItem(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone is String? ? phone : this.phone,
      active: active ?? this.active,
      profilePictureUrl: profilePictureUrl is String?
          ? profilePictureUrl
          : this.profilePictureUrl,
    );
  }
}
