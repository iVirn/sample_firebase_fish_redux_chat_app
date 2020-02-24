import 'package:fish_redux/fish_redux.dart';

enum SampleAction {
  onFetchData,
  setData,
}

class SampleActionCreator {
  static Action onFetchData() => const Action(SampleAction.onFetchData);

  static Action setData(String data) =>
      Action(SampleAction.setData, payload: data);
}
