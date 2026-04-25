// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['_id'] as String?,
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  passwordResetCode: json['passwordResetCode'] as String?,
  passwordResetExpires: json['passwordResetExpires'] == null
      ? null
      : DateTime.parse(json['passwordResetExpires'] as String),
  resetCodeVerified: json['resetCodeVerified'] as bool?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'isVerified': instance.isVerified,
  'createdAt': instance.createdAt?.toIso8601String(),
  'passwordResetCode': instance.passwordResetCode,
  'passwordResetExpires': instance.passwordResetExpires?.toIso8601String(),
  'resetCodeVerified': instance.resetCodeVerified,
};
