import 'package:mobx/mobx.dart';

class ContadorController {
  final _counter = Observable<int>(0);
  late Action increment;
  int get counter => _counter.value;

  ContadorController() {
    increment = Action(_incrementCounter);
  }
  void _incrementCounter() {
    _counter.value++;
  }
}
