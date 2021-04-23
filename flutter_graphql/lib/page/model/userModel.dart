
import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  String avatarUrl;
  String location;
  String name;
  String url;
  String email;
  String login;
  String bio;

  UserModel({required this.name,required this.avatarUrl,required this.bio,required this.email,required this.location,required this.login,required this.url});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}