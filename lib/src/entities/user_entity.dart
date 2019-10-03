import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {

  UserEntity({this.id, this.uid, this.full_name, this.username, this.email, this.password, this.photoURL, this.jwt, this.fcmToken});

  int id;
  String uid;
  String full_name;
  String username;
  String email;
  String password;
  String photoURL;
  String jwt;
  String fcmToken;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
