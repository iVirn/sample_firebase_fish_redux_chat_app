import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() => combineEffects(<Object, Effect<LoginState>>{
      LoginAction.onLogin: _onLogin,
    });

void _onLogin(Action action, Context<LoginState> ctx) async {}
