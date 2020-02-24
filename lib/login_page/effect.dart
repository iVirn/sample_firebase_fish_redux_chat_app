import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fish_redux/fish_redux.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../global_state/action.dart';
import '../global_state/store.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() => combineEffects(<Object, Effect<LoginState>>{
      LoginAction.onLogin: _onLogin,
      LoginAction.onProcessUser: _onProcessUser,
    });

void _onLogin(Action action, Context<LoginState> ctx) async {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  final googleUser = await _googleSignIn.signIn();
  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final user = (await _auth.signInWithCredential(credential)).user;

  if (user != null) {
    print("signed in " + user.displayName);

    ctx.dispatch(LoginActionCreator.onProcessUser(user));
  }
}

void _onProcessUser(Action action, Context<LoginState> ctx) async {
  final user = action.payload;

  // Сохраняем данные пользователя в глобальный стор
  GlobalStore.store.dispatch(GlobalActionCreator.setUser(user));

  // Проверяем новый ли это пользователь
  final result = await Firestore.instance
      .collection('users')
      .where('id', isEqualTo: user.uid)
      .getDocuments();

  final documents = result.documents;

  if (documents.length == 0) {
    final userData = {
      'nickname': user.displayName,
      'photoUrl': user.photoUrl,
      'id': user.uid,
    };
    // Обновляем данные у себя в БД
    Firestore.instance.collection('users').document(user.uid).setData(userData);
  }
}
