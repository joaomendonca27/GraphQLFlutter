import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graphql/page/description/descriptionController.dart';
import 'package:flutter_graphql/util/util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionPage extends StatefulWidget {

  final String userName;
  DescriptionPage({required this.userName});

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}


class _DescriptionPageState extends State<DescriptionPage> {

  DescriptionController descriptionController = Modular.get<DescriptionController>();

  @override
  Widget build(BuildContext context) {

    final HttpLink httpLink = HttpLink(defaultUrl, defaultHeaders: {"authorization": "Bearer $gitToken"},);

    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
        GraphQLClient(link: httpLink, cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept))
    );

    return GraphQLProvider(
      client: client,
      child: Observer(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.userName.toUpperCase()),
              backgroundColor: Colors.black,
              centerTitle: true,
              brightness: Brightness.dark,
            ),
            body: Query(
                options: QueryOptions(document: gql(readRepositories(userName: widget.userName)),),
                builder: (QueryResult result, { VoidCallback? refetch, FetchMore? fetchMore }) {
                  if (result.hasException) {
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4,left: 30,right: 30),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset("images/logoGit.png",color: Colors.red,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 45),
                              child: Text("${widget.userName.toUpperCase()}\nnão foi encontrado".toUpperCase(),style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600, color: Colors.red),textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (result.isLoading) {
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4,left: 30,right: 30),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset("images/logoGit.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 45),
                              child: Text("Procurando por ${widget.userName}".toUpperCase(),style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 45),
                              child: LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  descriptionController.updateUser(result.data["user"]);
                  descriptionController.updateListStarredRepositories(result.data["user"]["repositories"]["edges"]);

                  return SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Center(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(descriptionController.userModel!.avatarUrl),
                                    maxRadius: 90,
                                    backgroundColor: Colors.white,
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  descriptionController.userModel!.name.toUpperCase(),
                                  style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(descriptionController.userModel!.login.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: descriptionController.userModel!.bio.isEmpty ? 0 : 15),
                                child: Text(
                                  descriptionController.userModel!.bio,
                                  style: TextStyle(fontSize: descriptionController.userModel!.bio.isEmpty ? 0 : 18,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: descriptionController.userModel!.location == null ? 0 : 15),
                                child: Text(
                                  descriptionController.userModel!.location != null ? "De " + descriptionController.userModel!.location : "",
                                  style: TextStyle(fontSize: descriptionController.userModel!.location != null ? 0 : 18,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: descriptionController.userModel!.email.isEmpty ? 0 : 15),
                                child: InkWell(
                                  child: Text(
                                    descriptionController.userModel!.email.isNotEmpty ? "Contato " + descriptionController.userModel!.email : "",
                                    style: TextStyle(fontSize: descriptionController.userModel!.email.isNotEmpty ? 18 : 0,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,
                                  ),
                                  onTap: () async {
                                    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: descriptionController.userModel!.email,);
                                    if (await canLaunch(emailLaunchUri.toString())) {
                                      await launch(emailLaunchUri.toString());
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: descriptionController.userModel!.url.isEmpty ? 0 : 15,bottom: 15),
                                child: InkWell(
                                  child: Text(descriptionController.userModel!.url,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.blue,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
                                  onTap: () async {
                                    if (await canLaunch(descriptionController.userModel!.url)) {
                                      await launch(descriptionController.userModel!.url);
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Column(
                                  children: descriptionController.showRepositories(context),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  );
                }
            ),
          );
        },
      ),
    );
  }
}