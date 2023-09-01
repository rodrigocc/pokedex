import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Smart App',
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.red,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold))),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
