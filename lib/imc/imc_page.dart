import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/imc/imc_controller.dart';
import 'package:mobx_imc/widgets/imc_gauge.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final reactDisposer = reaction<bool>((_) => controller.hasErro, (hasError) {
      if (hasError) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(controller.error ?? "ERRO!!!!")),
        );
      }
    });
    reactionDisposer.addAll([reactDisposer]);
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    for (var disposer in reactionDisposer) {
      disposer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Mobx'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return ImcGauge(imc: controller.imc);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Peso"),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: "pt_BR",
                      symbol: "",
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Peso obrigatorio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Altura"),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: "pt_BR",
                      symbol: "",
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    ),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Altura obrigatoria";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formater = NumberFormat.simpleCurrency(
                        locale: "pt_BR",
                        decimalDigits: 2,
                      );
                      double peso = formater.parse(pesoEC.text) as double;
                      double altura = formater.parse(alturaEC.text) as double;

                      controller.calcularImc(altura: altura, peso: peso);
                    }
                  },
                  child: const Text("Calcular IMC"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
