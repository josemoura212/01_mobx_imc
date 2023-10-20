import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
part 'observable_list_controoler.g.dart';

class ObservableListControoler = ObservableListControolerBase
    with _$ObservableListControoler;

abstract class ObservableListControolerBase with Store {
  @observable
  //var product = <ProductModel>[];
  // ObservableList product = ObservableList();
  var product = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    // final productData = [
    //   ProductModel(name: "Computador"),
    //   ProductModel(name: "Celular"),
    //   ProductModel(name: "Teclado"),
    //   ProductModel(name: "Mouse"),
    // ];
    // product = productData;
    product.clear();
    product.addAll([
      ProductModel(name: "Computador"),
      ProductModel(name: "Celular"),
      ProductModel(name: "Teclado"),
      ProductModel(name: "Mouse"),
    ]);
  }

  @action
  void adicionarProduct() {
    product.add(ProductModel(name: "Computador"));
  }

  @action
  void removerProduct() {
    product.removeAt(0);
  }
}
