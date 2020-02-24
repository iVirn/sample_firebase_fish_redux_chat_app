import 'package:fish_redux/fish_redux.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../global_state/action.dart';
import '../global_state/store.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() => combineEffects(<Object, Effect<LoginState>>{
      LoginAction.onLogin: _onLogin,
    });

void _onLogin(Action action, Context<LoginState> ctx) async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  print("signed in " + user.displayName);

  GlobalStore.store.dispatch(GlobalActionCreator.setUser(user));
}
