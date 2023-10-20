// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatefulWidget {
  const ContadorCodegenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  final controller = ContadorCodegenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    // ? AutoRun fica escutando as variaveis que estao sendo usadas dentro dele
    // ? e tambem roda logo quando criado
    final autorunDisposer = autorun((_) {
      print("-----------auto run ---------------");
      print(controller.fullName.first);
      print(controller.fullName.last);
    });

    // ? reaction nos falamos para o mobx qual atributo observavel queremos observar
    final reactionDispose = reaction((_) => controller.counter, (counter) {
      print("--------------- reaction ---------");
      print(counter);
    });

    final whenDisposer =
        when((_) => controller.fullName.first == "Jose Augusto", () {
      print("---------------- when-------------");
      print(controller.fullName.first);
    });

    reactionDisposer.addAll([
      autorunDisposer,
      reactionDispose,
      whenDisposer,
    ]);
  }

  @override
  void dispose() {
    for (var reaction in reactionDisposer) {
      reaction();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Mobx Codegen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the buttn this time:"),
            Observer(
              builder: (_) {
                return Text(
                  "${controller.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.first);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.last);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.saudacao);
              },
            ),
            TextButton(
              onPressed: () => controller.changeName(),
              child: const Text("Alterar nome"),
            ),
            TextButton(
              onPressed: () => controller.rollbackName(),
              child: const Text("Rollback nome"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
