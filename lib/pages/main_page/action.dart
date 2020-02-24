import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_redux/fish_redux.dart';

enum MainAction {
  onFetchUsers,
  setUsers,
  onOpenChat,
}

class MainActionCreator {
  static Action onFetchUsers() => const Action(MainAction.onFetchUsers);

  static Action setUsers(List<FirebaseUser> users) =>
      Action(MainAction.setUsers, payload: users);

  static Action onOpenChat(FirebaseUser user) =>
      Action(MainAction.onOpenChat, payload: user);
}
