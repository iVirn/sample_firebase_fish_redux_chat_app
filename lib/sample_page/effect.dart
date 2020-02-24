import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

StreamSubscription<QuerySnapshot> _subscription;

Effect<SampleState> buildEffect() =>
    combineEffects(<Object, Effect<SampleState>>{
      SampleAction.onFetchData: _onFetchData,
      Lifecycle.initState: _onInit,
      Lifecycle.dispose: _onDispose,
    });

void _onInit(Action action, Context<SampleState> ctx) =>
    ctx.dispatch(SampleActionCreator.onFetchData());

void _onDispose(Action action, Context<SampleState> ctx) =>
    _subscription.cancel();

void _onFetchData(Action action, Context<SampleState> ctx) async {
  final snapshots = Firestore.instance.collection('sample').snapshots();
  _subscription = snapshots.listen((event) {
    final name = event.documents.first['name'];
    ctx.dispatch(SampleActionCreator.setData(name));
  });
}
