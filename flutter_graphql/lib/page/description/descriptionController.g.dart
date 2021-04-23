// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptionController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DescriptionController on _DescriptionControllerBase, Store {
  final _$userModelAtom = Atom(name: '_DescriptionControllerBase.userModel');

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$listStarredRepositoriesAtom =
      Atom(name: '_DescriptionControllerBase.listStarredRepositories');

  @override
  List<RepositoriesModel>? get listStarredRepositories {
    _$listStarredRepositoriesAtom.reportRead();
    return super.listStarredRepositories;
  }

  @override
  set listStarredRepositories(List<RepositoriesModel>? value) {
    _$listStarredRepositoriesAtom
        .reportWrite(value, super.listStarredRepositories, () {
      super.listStarredRepositories = value;
    });
  }

  final _$_DescriptionControllerBaseActionController =
      ActionController(name: '_DescriptionControllerBase');

  @override
  dynamic updateUser(dynamic user) {
    final _$actionInfo = _$_DescriptionControllerBaseActionController
        .startAction(name: '_DescriptionControllerBase.updateUser');
    try {
      return super.updateUser(user);
    } finally {
      _$_DescriptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateListStarredRepositories(List<dynamic> edges) {
    final _$actionInfo =
        _$_DescriptionControllerBaseActionController.startAction(
            name: '_DescriptionControllerBase.updateListStarredRepositories');
    try {
      return super.updateListStarredRepositories(edges);
    } finally {
      _$_DescriptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
listStarredRepositories: ${listStarredRepositories}
    ''';
  }
}
