import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ChatAction { action }

class ChatActionCreator {
  static Action onAction() {
    return const Action(ChatAction.action);
  }
}
