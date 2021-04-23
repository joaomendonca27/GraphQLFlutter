import 'package:json_annotation/json_annotation.dart';

part 'repositoriesModel.g.dart';

@JsonSerializable()
class RepositoriesModel {
  String name;
  int stargazerCount;
  String description;

  RepositoriesModel({required this.name, required this.stargazerCount, required this.description});

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) => _$RepositoriesModelFromJson(json);
}