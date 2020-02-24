import 'package:fish_redux/fish_redux.dart';

enum LoginAction {
  onLogin,
}

class LoginActionCreator {
  static Action onLogin() => const Action(LoginAction.onLogin);
}
