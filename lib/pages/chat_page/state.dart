import 'package:fish_redux/fish_redux.dart';

class ChatState implements Cloneable<ChatState> {

  @override
  ChatState clone() {
    return ChatState();
  }
}

ChatState initState(Map<String, dynamic> args) {
  return ChatState();
}
