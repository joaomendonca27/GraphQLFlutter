import 'package:flutter_graphql/page/description/descriptionController.dart';
import 'package:flutter_graphql/page/description/descriptionPage.dart';
import 'package:flutter_graphql/page/home/homePage.dart';
import 'package:flutter_graphql/page/splash/splashPage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    Bind((i) => DescriptionController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_,__) => SplashPage()),
    ChildRoute(Modular.initialRoute + 'home', child: (_,__) => HomePage()),
    ChildRoute(Modular.initialRoute + 'description', child: (_,args) => DescriptionPage(userName: args.data,)),
  ];

}
