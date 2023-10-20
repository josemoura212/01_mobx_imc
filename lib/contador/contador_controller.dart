import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name_model.dart';

class ContadorController {
  final _counter = Observable<int>(0, name: "Counter observable");
  final _fullName =
      Observable<FullName>(FullName(first: "José", last: "Moura"));

  late Action increment;
  late Computed _saudacaoComputed;

  ContadorController() {
    increment = Action(_incrementCounter);
    _saudacaoComputed = Computed(() => "Olá ${_fullName.value.first}");
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    //! nao pode ser assim
    // _fullName.value.first = "José Augusto";
    // _fullName.value.last = "Soares";

    //! opçao 1, alterar por meio de prototype(copyWith)
    //! troca isso
    // _fullName.value = FullName(first: "José Augusto", last: "Soares");

    //! por:
    _fullName.value =
        _fullName.value.copyWith(first: "Jose Augusto", last: "Moura");
  }
}
