import 'package:fish_redux/fish_redux.dart';

import 'global_state/state.dart';
import 'global_state/store.dart';

import 'pages/sample_page/page.dart';
import 'pages/login_page/page.dart';
import 'pages/main_page/page.dart';
import 'pages/chat_page/page.dart';

// Чтобы не хардкодить везде стринги, сделаем класс-хелпер с константами
class AppPageName {
  static const sample = 'sample';
  static const login = 'login';
  static const main = 'main';
  static const chat = 'chat';
}

// Объявляем и создаём возможные страницы в приложении, матчим с названиями
final pageRoutes = PageRoutes(
  pages: {
    AppPageName.sample: SamplePage(),
    AppPageName.login: LoginPage(),
    AppPageName.main: MainPage(),
    AppPageName.chat: ChatPage(),
  },
  visitor: (String path, Page<Object, dynamic> page) {
    if (page.isTypeof<GlobalBaseState>()) {
      page.connectExtraStore<GlobalState>(
        GlobalStore.store,
        (Object pagestate, GlobalState appState) {
          final GlobalBaseState p = pagestate;
          if (p.user != appState.user) {
            if (pagestate is Cloneable) {
              final GlobalBaseState newState = pagestate.clone();
              newState.user = appState.user;
              return newState;
            }
          }
          return pagestate;
        },
      );
    }
    page.enhancer.append(
      /// Effect AOP
      effectMiddleware: [
        _pageAnalyticsMiddleware<dynamic>(),
      ],

      /// Store AOP
      middleware: <Middleware<dynamic>>[
        logMiddleware<dynamic>(tag: page.runtimeType.toString()),
      ],
    );
  },
);

EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic>) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
