import 'package:fish_redux/fish_redux.dart';

// Перечисление возможных на странице экшенов.
// Описывает то, что страница может делать и все возможные действия со
// стороны пользователя.
enum SampleAction {
  onFetchData,
  setData,
}

// Класс-хелпер для отправки экшенов в стор. Содержит простые методы,
// возможно принимающие какой-то пейлоад и возвращающие объект Action нужного типа
class SampleActionCreator {
  // Экшен без пейлоада. Может быть const для перформанса
  static Action onFetchData() => const Action(SampleAction.onFetchData);

  // Экшен с пейлоадом. Не может быть const
  static Action setData(String data) =>
      Action(SampleAction.setData, payload: data);
}
