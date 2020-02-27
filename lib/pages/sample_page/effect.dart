import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

StreamSubscription<QuerySnapshot> _subscription;

Effect<SampleState> buildEffect() =>
    combineEffects(<Object, Effect<SampleState>>{
      // Присваиваем получению экшена onFetchData исполнение функции-эффекта _onFetchData
      SampleAction.onFetchData: _onFetchData,
      // Присваиваем эффекты для экшенов жизненного цикла страницы
      Lifecycle.initState: _onInit,
      Lifecycle.dispose: _onDispose,
    });

// Эффект, который вызовется при инициализации страницы
void _onInit(Action action, Context<SampleState> ctx) =>
    // Отправляет в стор страницы экшн. Стартуем подписку при инициализации
    ctx.dispatch(SampleActionCreator.onFetchData());

// Эффект, который вызовется при деинициализации страницы
void _onDispose(Action action, Context<SampleState> ctx) =>
    // Закрываем подписку при деинициализации страницы
    _subscription.cancel();

// Функция-эффект, которая вызовется при получении стором экшена onFetchData
void _onFetchData(Action action, Context<SampleState> ctx) async {
  // Получаем данные из файрбейза, делаем подписку
  final snapshots = Firestore.instance.collection('sample').snapshots();
  _subscription = snapshots.listen((event) {
    if (event.documents.isNotEmpty) {
      final name = event.documents.first['name'];
      // На каждый новый ивент диспатчим экшен setData с обновлёнными данными из ивента
      ctx.dispatch(SampleActionCreator.setData(name));
    }
  });
}
