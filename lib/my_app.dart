import 'package:flutter/material.dart';

import 'package:pokemon_consome_api/presenter/pages/initial_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const InitialPage(title: 'Pokemon Consume API'),
    );
  }
}
