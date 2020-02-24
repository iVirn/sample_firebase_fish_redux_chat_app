import 'package:fish_redux/fish_redux.dart';

class SampleState implements Cloneable<SampleState> {
  String data;

  @override
  SampleState clone() => SampleState()..data = data;
}

SampleState initState(Map<String, dynamic> args) =>
    SampleState()..data = 'Not Fetched Yet';
