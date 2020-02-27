import 'package:fish_redux/fish_redux.dart';

import 'package:flutter/material.dart';

import 'state.dart';

// View страницы. Не должна содержать никакой бизнес-логики.
// Строится на осноовании данных в state
Widget buildView(
  SampleState state,
  Dispatch dispatch,
  ViewService viewService,
) =>
    Scaffold(
      appBar: AppBar(
        title: Text('Sample Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // Смотрим на стейт и берём из него данные
              state.data,
              style: Theme.of(viewService.context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
