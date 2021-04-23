// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesModel _$RepositoriesModelFromJson(Map<String, dynamic> json) {
  return RepositoriesModel(
    name: json['name'] as String,
    stargazerCount: json['stargazerCount'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$RepositoriesModelToJson(RepositoriesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stargazerCount': instance.stargazerCount,
      'description': instance.description,
    };
