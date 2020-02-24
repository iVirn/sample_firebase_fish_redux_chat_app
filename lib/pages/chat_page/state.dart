import 'package:firebase_auth/firebase_auth.dart';

import '../../global_state/state.dart';

import '../../models/message.dart';
import '../../models/user.dart';

class ChatState implements GlobalBaseState<ChatState> {
  Peer peer;
  List<Message> messages;

  String get chatId => user.uid.hashCode <= peer.id.hashCode
      ? '${user.uid}-${peer.id}'
      : '${peer.id}-${user.uid}';

  @override
  ChatState clone() => ChatState()
    ..user = user
    ..peer = peer
    ..messages = messages;

  @override
  FirebaseUser user;
}

ChatState initState(Map<String, dynamic> args) => ChatState()
  ..peer = args['peer']
  ..messages = [];
