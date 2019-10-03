// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
      id: json['id'] as int,
      uid: json['uid'] as String,
      full_name: json['full_name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      photoURL: json['photoURL'] as String,
      jwt: json['jwt'] as String,
      fcmToken: json['fcmToken'] as String);
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'full_name': instance.full_name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'photoURL': instance.photoURL,
      'jwt': instance.jwt,
      'fcmToken': instance.fcmToken
    };
