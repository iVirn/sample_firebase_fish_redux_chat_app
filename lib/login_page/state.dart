import 'package:firebase_auth/firebase_auth.dart';

import '../global_state/state.dart';

class LoginState implements GlobalBaseState<LoginState> {
  @override
  LoginState clone() => LoginState();

  @override
  FirebaseUser user;
}

LoginState initState(Map<String, dynamic> args) => LoginState();
