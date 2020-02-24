import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() => asReducer(
      <Object, Reducer<MainState>>{
        MainAction.setPeers: _setPeers,
      },
    );

MainState _setPeers(MainState state, Action action) =>
    state.clone()..peers = List.from(action.payload);
