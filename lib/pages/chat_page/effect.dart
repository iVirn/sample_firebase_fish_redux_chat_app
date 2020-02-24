import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fish_redux/fish_redux.dart';

import '../../models/message.dart';

import 'action.dart';
import 'state.dart';

StreamSubscription<QuerySnapshot> _subscription;

Effect<ChatState> buildEffect() => combineEffects(<Object, Effect<ChatState>>{
      ChatAction.onSendMessage: _onSendMessage,
      Lifecycle.initState: _onInit,
      Lifecycle.dispose: _onDispose,
    });

void _onInit(Action action, Context<ChatState> ctx) {
  final data = Firestore.instance
      .collection('messages')
      .document(ctx.state.chatId)
      .collection(ctx.state.chatId)
      .orderBy('timestamp', descending: true)
      .limit(20)
      .snapshots();

  _subscription = data.listen((snapshot) {
    final messages =
        snapshot.documents.map((doc) => Message.fromDocument(doc)).toList();

    ctx.dispatch(ChatActionCreator.setMessages(messages));
  });
}

void _onDispose(Action action, Context<ChatState> ctx) {
  _subscription.cancel();
}

void _onSendMessage(Action action, Context<ChatState> ctx) {
  final text = action.payload as String;

  final message = Message(
    idFrom: ctx.state.user.uid,
    idTo: ctx.state.peer.id,
    text: text,
    timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
  );

  print(message.toJson());

  var documentReference = Firestore.instance
      .collection('messages')
      .document(ctx.state.chatId)
      .collection(ctx.state.chatId)
      .document(DateTime.now().millisecondsSinceEpoch.toString());

  Firestore.instance.runTransaction((transaction) async {
    await transaction.set(
      documentReference,
      message.toJson(),
    );
  });

  print('done');
}
