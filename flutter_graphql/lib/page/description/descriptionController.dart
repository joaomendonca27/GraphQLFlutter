import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql/page/model/repositoriesModel.dart';
import 'package:flutter_graphql/page/model/userModel.dart';
import 'package:mobx/mobx.dart';

part 'descriptionController.g.dart';

class DescriptionController = _DescriptionControllerBase with _$DescriptionController;

abstract class _DescriptionControllerBase with Store {

  @observable
  UserModel? userModel;

  @observable
  List<RepositoriesModel>? listStarredRepositories;

  @action
  updateUser(dynamic user) {
    userModel = UserModel.fromJson(user);
  }

  @action
  updateListStarredRepositories(List<dynamic> edges) {
    List<RepositoriesModel> list = [];
    for(var item in edges) {
      list.add(RepositoriesModel.fromJson(item["node"]));
    }
    listStarredRepositories = list;
  }

  List<Widget> showRepositories(BuildContext context) {
    List<Widget> listRepositories = [];

    for(var item in listStarredRepositories!) {
      Container body = Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21,right: 21),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.star,color: item.stargazerCount != 0 ? Colors.yellow : Colors.grey,),
                      Text(item.stargazerCount.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black,),textAlign: TextAlign.center,),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          children: [
                            Center(
                              child: Text(item.name.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                item.description != null ? item.description : "",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12,bottom: 18),
              child: Container(
                height: 1,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      );
      listRepositories.add(body);
    }

    return listRepositories;
  }
}