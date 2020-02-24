import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ChatState> buildReducer() => asReducer(
      <Object, Reducer<ChatState>>{
        ChatAction.setMessages: _setMessages,
      },
    );

ChatState _setMessages(ChatState state, Action action) =>
    state.clone()..messages = List.from(action.payload);
