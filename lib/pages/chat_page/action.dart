import 'package:fish_redux/fish_redux.dart';

import '../../models/message.dart';

enum ChatAction { setMessages, onSendMessage }

class ChatActionCreator {
  static Action setMessages(List<Message> messages) =>
      Action(ChatAction.setMessages, payload: messages);

  static Action onSendMessage(String text) =>
      Action(ChatAction.onSendMessage, payload: text);
}
