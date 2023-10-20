import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/list/observable_list_controoler.dart';

class ObservableListPage extends StatelessWidget {
  final controller = ObservableListControoler();
  ObservableListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
