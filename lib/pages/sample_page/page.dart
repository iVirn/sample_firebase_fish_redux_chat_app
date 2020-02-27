import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SamplePage extends Page<SampleState, Map<String, dynamic>> {
  SamplePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SampleState>(
            adapter: null,
            slots: <String, Dependent<SampleState>>{},
          ),
          middleware: <Middleware<SampleState>>[],
          // Метод, вызывающийся при пересоздании стейта и указывающий view,
          // нужно ли ей перерисовываться
          shouldUpdate: _shouldUpdate,
        );
}

// Сравниваем здесь значения полей старого стейта и нового.
// Пропуская те, что не важны для view, позволяем им обновляться,
// не инициируя при этом перерисовки view.
// По умолчанию view перерисовывается при каждом обновлении стейта,
// что может плохо сказываться на производительности приложения
// при наличии большого количества часто обновляющихся полей в стейте
bool _shouldUpdate(SampleState oldState, SampleState newState) =>
    oldState.data != newState.data;
