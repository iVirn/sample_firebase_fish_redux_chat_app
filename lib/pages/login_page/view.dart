import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
  LoginState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Login'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            state.user != null
                ? state.user.displayName
                : 'You are not logged in',
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Sign In with Google'),
            onPressed: () => dispatch(LoginActionCreator.onLogin()),
          ),
        ],
      ),
    ),
  );
}
