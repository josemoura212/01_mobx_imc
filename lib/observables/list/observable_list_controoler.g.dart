// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_list_controoler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObservableListControoler on ObservableListControolerBase, Store {
  late final _$productAtom =
      Atom(name: 'ObservableListControolerBase.product', context: context);

  @override
  ObservableList<ProductModel> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ObservableList<ProductModel> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$ObservableListControolerBaseActionController =
      ActionController(name: 'ObservableListControolerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$ObservableListControolerBaseActionController
        .startAction(name: 'ObservableListControolerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$ObservableListControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarProduct() {
    final _$actionInfo = _$ObservableListControolerBaseActionController
        .startAction(name: 'ObservableListControolerBase.adicionarProduct');
    try {
      return super.adicionarProduct();
    } finally {
      _$ObservableListControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerProduct() {
    final _$actionInfo = _$ObservableListControolerBaseActionController
        .startAction(name: 'ObservableListControolerBase.removerProduct');
    try {
      return super.removerProduct();
    } finally {
      _$ObservableListControolerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}
