// ignore_for_file: avoid_print

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelo Observado Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                print("LISTAAAAAAAAAA");
                return ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    final productStore = controller.product[index];
                    return Observer(
                      builder: (_) {
                        print("CHECKBOXXXXXXX");
                        return CheckboxListTile(
                          value: productStore.selected,
                          onChanged: (_) => controller.selectedProduct(index),
                          title: Text(productStore.product.name),
                        );
                      },
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
