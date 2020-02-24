import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'sample_page/page.dart';

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

// Объявляем и создаём возможные страницы в приложении, матчим с названиями
final pageRoutes = PageRoutes(
  pages: {
    AppPageName.sample: SamplePage(),
  },
);
