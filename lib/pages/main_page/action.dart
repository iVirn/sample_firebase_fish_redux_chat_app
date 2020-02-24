import 'package:fish_redux/fish_redux.dart';

import '../../models/user.dart';

enum MainAction {
  onFetchUsers,
  setPeers,
  onOpenChat,
}

class MainActionCreator {
  static Action onFetchUsers() => const Action(MainAction.onFetchUsers);

  static Action setPeers(List<Peer> users) =>
      Action(MainAction.setPeers, payload: users);

  static Action onOpenChat(Peer peer) =>
      Action(MainAction.onOpenChat, payload: peer);
}
