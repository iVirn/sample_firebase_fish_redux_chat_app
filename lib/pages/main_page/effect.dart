import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() => combineEffects(<Object, Effect<MainState>>{
      MainAction.onFetchUsers: _onFetchUsers,
      MainAction.onOpenChat: _onOpenChat,
      Lifecycle.initState: _onInit,
    });

void _onInit(Action action, Context<MainState> ctx) {
  //
}

void _onFetchUsers(Action action, Context<MainState> ctx) {
  //
}

void _onOpenChat(Action action, Context<MainState> ctx) {
  //
}
