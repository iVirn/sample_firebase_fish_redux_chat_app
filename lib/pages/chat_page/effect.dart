import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ChatState> buildEffect() {
  return combineEffects(<Object, Effect<ChatState>>{
    ChatAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ChatState> ctx) {
}
