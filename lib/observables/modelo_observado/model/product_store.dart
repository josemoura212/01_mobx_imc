// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:mobx_imc/model/product_model.dart';

part 'product_store.g.dart';

// ignore: library_private_types_in_public_api
class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  @observable
  ProductModel product;
  @observable
  bool selected;
  _ProductStoreBase({
    required this.product,
    required this.selected,
  });
}
