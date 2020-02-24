import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() => asReducer(
      <Object, Reducer<MainState>>{
        MainAction.setUsers: _setUsers,
      },
    );

MainState _setUsers(MainState state, Action action) => state.clone();
