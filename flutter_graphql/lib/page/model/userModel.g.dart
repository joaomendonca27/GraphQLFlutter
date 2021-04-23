// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String,
    avatarUrl: json['avatarUrl'] as String,
    bio: json['bio'] as String,
    email: json['email'] as String,
    location: json['location'] as String,
    login: json['login'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'location': instance.location,
      'name': instance.name,
      'url': instance.url,
      'email': instance.email,
      'login': instance.login,
      'bio': instance.bio,
    };
