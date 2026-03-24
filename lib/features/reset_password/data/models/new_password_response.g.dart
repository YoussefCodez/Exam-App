// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordResponse _$NewPasswordResponseFromJson(Map<String, dynamic> json) =>
    NewPasswordResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$NewPasswordResponseToJson(
  NewPasswordResponse instance,
) => <String, dynamic>{'message': instance.message, 'token': instance.token};
