import 'package:fish_redux/fish_redux.dart';

import 'package:firebase_auth/firebase_auth.dart';

enum LoginAction {
  onLogin,
  onProcessUser,
}

class LoginActionCreator {
  static Action onLogin() => const Action(LoginAction.onLogin);

  static Action onProcessUser(FirebaseUser user) =>
      Action(LoginAction.onProcessUser, payload: user);
}
