import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() => asReducer(
      <Object, Reducer<GlobalState>>{
        GlobalAction.setUser: _setUser,
      },
    );

GlobalState _setUser(GlobalState state, Action action) =>
    state.clone()..user = action.payload;
