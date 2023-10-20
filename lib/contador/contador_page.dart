import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/contador_controller.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();
  ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Mobx'),
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
            Observer(builder: (_) {
              return Text(controller.saudacao);
            }),
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
