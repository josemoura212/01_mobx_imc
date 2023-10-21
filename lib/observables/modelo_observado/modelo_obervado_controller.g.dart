// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_obervado_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModeloObervadoController on ModeloObervadoControllerBase, Store {
  late final _$productAtom =
      Atom(name: 'ModeloObervadoControllerBase.product', context: context);

  @override
  ObservableList<ProductStore> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ObservableList<ProductStore> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$ModeloObervadoControllerBaseActionController =
      ActionController(name: 'ModeloObervadoControllerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$ModeloObervadoControllerBaseActionController
        .startAction(name: 'ModeloObervadoControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$ModeloObervadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarProduct() {
    final _$actionInfo = _$ModeloObervadoControllerBaseActionController
        .startAction(name: 'ModeloObervadoControllerBase.adicionarProduct');
    try {
      return super.adicionarProduct();
    } finally {
      _$ModeloObervadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerProduct() {
    final _$actionInfo = _$ModeloObervadoControllerBaseActionController
        .startAction(name: 'ModeloObervadoControllerBase.removerProduct');
    try {
      return super.removerProduct();
    } finally {
      _$ModeloObervadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedProduct(int index) {
    final _$actionInfo = _$ModeloObervadoControllerBaseActionController
        .startAction(name: 'ModeloObervadoControllerBase.selectedProduct');
    try {
      return super.selectedProduct(index);
    } finally {
      _$ModeloObervadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}
