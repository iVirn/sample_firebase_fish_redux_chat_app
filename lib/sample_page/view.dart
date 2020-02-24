import 'package:fish_redux/fish_redux.dart';

import 'package:flutter/material.dart';

import 'state.dart';

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
              state.data,
              style: Theme.of(viewService.context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
