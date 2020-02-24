import 'package:fish_redux/fish_redux.dart';

import 'package:firebase_auth/firebase_auth.dart';

enum GlobalAction {
  setUser,
}

class GlobalActionCreator {
  static Action setUser(FirebaseUser user) =>
      Action(GlobalAction.setUser, payload: user);
}
