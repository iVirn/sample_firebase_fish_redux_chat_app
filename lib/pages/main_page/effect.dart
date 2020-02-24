import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart' hide Action;

import '../../app_routes.dart';
import '../../models/user.dart';

import 'action.dart';
import 'state.dart';

StreamSubscription<QuerySnapshot> _subscription;

Effect<MainState> buildEffect() => combineEffects(<Object, Effect<MainState>>{
      MainAction.onFetchUsers: _onFetchUsers,
      MainAction.onOpenChat: _onOpenChat,
      Lifecycle.initState: _onInit,
      Lifecycle.dispose: _onDispose,
    });

void _onInit(Action action, Context<MainState> ctx) {
  ctx.dispatch(MainActionCreator.onFetchUsers());
}

void _onDispose(Action action, Context<MainState> ctx) {
  _subscription.cancel();
}

void _onFetchUsers(Action action, Context<MainState> ctx) {
  final users = Firestore.instance.collection('users').snapshots();

  _subscription = users.listen((event) {
    final peers = event.documents.map((e) => Peer.fromDocument(e)).toList();
    ctx.dispatch(MainActionCreator.setPeers(peers));
  });
}

void _onOpenChat(Action action, Context<MainState> ctx) {
  final peer = action.payload as Peer;
  print(peer?.nickname);

  Navigator.of(ctx.context).pushNamed(AppPageName.chat);
}
