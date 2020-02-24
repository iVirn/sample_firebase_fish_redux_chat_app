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
        );
}
