import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
import 'package:mobx_imc/observables/modelo_observado/model/product_store.dart';
part 'modelo_obervado_controller.g.dart';

class ModeloObervadoController = ModeloObervadoControllerBase
    with _$ModeloObervadoController;

abstract class ModeloObervadoControllerBase with Store {
  @observable
  //var product = <ProductModel>[];
  // ObservableList product = ObservableList();
  var product = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    product.clear();
    product.addAll([
      ProductStore(product: ProductModel(name: "Computador"), selected: false),
      ProductStore(product: ProductModel(name: "Celular"), selected: false),
      ProductStore(product: ProductModel(name: "Teclado"), selected: false),
      ProductStore(product: ProductModel(name: "Mouse"), selected: false),
    ]);
  }

  @action
  void adicionarProduct() {
    product.add(ProductStore(
        product: ProductModel(name: "Computador"), selected: false));
  }

  @action
  void removerProduct() {
    product.removeAt(0);
  }

  @action
  void selectedProduct(int index) {
    var produectSelected = product[index].selected;
    product[index].selected = !produectSelected;
  }
}
