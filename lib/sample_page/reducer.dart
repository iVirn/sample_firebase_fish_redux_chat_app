import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SampleState> buildReducer() => asReducer(
      <Object, Reducer<SampleState>>{
        // Присваиваем получению экшена setData исполнение функции-редюсера _setData
        SampleAction.setData: _setData,
      },
    );

// Редюсер. Исполнится при получении стором экшена setData.
// Возвращает новый стейт с новым значением поля dataы
SampleState _setData(SampleState state, Action action) =>
    state.clone()..data = action.payload;
