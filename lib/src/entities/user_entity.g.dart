// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
      fcmToken: json['fcmToken'] as String);
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'jwt': instance.jwt,
      'fcmToken': instance.fcmToken
    };
