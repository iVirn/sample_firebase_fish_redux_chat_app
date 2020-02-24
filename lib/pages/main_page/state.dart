import 'package:fish_redux/fish_redux.dart';

import '../../models/user.dart';

class MainState implements Cloneable<MainState> {
  List<Peer> peers;

  @override
  MainState clone() => MainState()..peers = peers;
}

MainState initState(Map<String, dynamic> args) => MainState()..peers = [];
