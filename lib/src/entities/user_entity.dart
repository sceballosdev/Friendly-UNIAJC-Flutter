import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {

  UserEntity({this.id, this.username, this.email, this.password, this.jwt, this.fcmToken});

  int id;
  String username;
  String email;
  String password;
  String jwt;
  String fcmToken;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
