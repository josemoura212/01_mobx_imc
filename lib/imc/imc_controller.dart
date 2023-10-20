import 'dart:math';

import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = ImcControllerBase with _$ImcController;

abstract class ImcControllerBase with Store {
  @observable
  double imc = 0.0;

  @observable
  String? error;

  @computed
  bool get hasErro => error != null;

  @action
  Future<void> calcularImc({
    required double altura,
    required double peso,
  }) async {
    try {
      error = null;
      imc = 0;
      await Future.delayed(const Duration(seconds: 1));
      imc = peso / pow(altura, 2);
      if (imc > 35) {
        throw Exception();
      } else if (imc < 10) {
        throw Exception();
      }
    } catch (e) {
      error = "Erro ao calcular o IMC";
    }
  }
}
