import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/appModule.dart';
import 'app/appWidget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget(),));