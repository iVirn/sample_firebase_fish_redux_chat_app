import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SampleState> buildReducer() => asReducer(
      <Object, Reducer<SampleState>>{
        SampleAction.setData: _setData,
      },
    );

SampleState _setData(SampleState state, Action action) =>
    state.clone()..data = action.payload;
