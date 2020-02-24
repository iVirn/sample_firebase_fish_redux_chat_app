import 'package:fish_redux/fish_redux.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  FirebaseUser user;
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  FirebaseUser user;

  @override
  GlobalState clone() => GlobalState()..user = user;
}
