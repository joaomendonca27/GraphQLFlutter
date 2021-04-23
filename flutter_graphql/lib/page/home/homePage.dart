import 'package:flutter/material.dart';
import 'package:flutter_graphql/util/util.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(brightness: Brightness.light, elevation: 0, toolbarHeight: 0, backgroundColor: Colors.white,),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
                  child: Center(
                    child: Image.asset("images/logoGit.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30,top: 60),
                  child: Text("Informe o nome do perfil do GITHUB desejado.",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 45),
                    child: TextFormField(
                      controller: nameController,
                      enabled: true,
                      style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),
                      decoration: new InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Nome do perfil"
                      ),
                      validator: (text) {
                        if(text!.isEmpty){
                          return campoVazio;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 60),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextButton.icon(
                      icon: Image.asset("images/logoGit.png",height: 27,),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(30),
                            )
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.grey),
                      ),
                      label: Padding(
                        padding: EdgeInsets.only(left: 15,right: 15,top: 3,bottom: 3),
                        child: Text("Buscar",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Colors.black),textAlign: TextAlign.center,),
                      ),
                      onPressed: (){
                        FocusScope.of(context).unfocus();
                        if(formKey.currentState!.validate()){
                          Modular.to.pushNamed(Modular.initialRoute + "description",arguments: nameController.text);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}