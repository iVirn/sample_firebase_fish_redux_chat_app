import 'package:flutter/material.dart' hide Action;

import 'app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Создаём страницу с нужным именем, исходя из объявленной ниже Map
        home: pageRoutes.buildPage(AppPageName.sample, null),
      );
}
