import 'package:fish_redux/fish_redux.dart';

class SampleState implements Cloneable<SampleState> {
  // Поле в стейте, содержащее какие-то данные
  String data;

  // Обязательно переопределить метод clone() — именно он вызывается
  // редюсером при пересоздании стейта. Чтобы не терять данные, нужно
  // переприсваивать значения при клонировании
  @override
  SampleState clone() => SampleState()..data = data;
}

SampleState initState(Map<String, dynamic> args) =>
    // Изначальное значение поля. null, если не указывать. Можно присвоить значение
    // из параметра args — в него прилетает то, что передаётся при вызове
    // метода buildPage(name, args) в качестве второго аргумента
    SampleState()..data = 'Not Fetched Yet';
