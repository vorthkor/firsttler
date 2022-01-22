// Um statelessWidget - sem estado
// Estado global
// precisa herdar de algo que tenha widget
// estende de stateless widget
import 'package:exemplo/app_controller.dart';
import 'package:exemplo/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //build constroi os widgets na tela
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: AppController.instance.isDartTheme
                  ? Brightness.dark
                  : Brightness.light,
            ), //ThemeData(primarySwatch: Colors.red),
            //stateful instaciado corretamente
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
            },
          );
        });
  }
}