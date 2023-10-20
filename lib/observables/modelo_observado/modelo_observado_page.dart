import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_obervado_controller.dart';

class ModeloObservadoPage extends StatefulWidget {
  const ModeloObservadoPage({Key? key}) : super(key: key);

  @override
  State<ModeloObservadoPage> createState() => _ModeloObservadoPageState();
}

class _ModeloObservadoPageState extends State<ModeloObservadoPage> {
  final controller = ModeloObervadoController();

  @override
  Widget build(BuildContext context) {
    print("teste");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    final product = controller.product[index];
                    return CheckboxListTile(
                      value: false,
                      onChanged: (_) {},
                      title: Text(product.name),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => controller.adicionarProduct(),
                child: const Text("Adicionar"),
              ),
              TextButton(
                onPressed: () => controller.removerProduct(),
                child: const Text("Remover"),
              ),
              TextButton(
                onPressed: () => controller.loadProducts(),
                child: const Text("Carregar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
