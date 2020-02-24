import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChatState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChatState>>{
      ChatAction.action: _onAction,
    },
  );
}

ChatState _onAction(ChatState state, Action action) {
  final ChatState newState = state.clone();
  return newState;
}
