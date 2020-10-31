import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../network/api/apis.dart';

import '../../network/model/models.dart';

final _productAPI = ProductApi();

class ProductProvider extends StateNotifier<List<ProductModel>> {
  ProductProvider([state]) : super(state ?? []);

  Future<String> add(ProductModel product) async {
    final result = await _productAPI.insertProduct(
      name: product.name,
      price: product.price,
      stock: product.stock,
      summary: product.summary,
      description: product.description,
      imageProduct: product.imageProduct,
    );

    final ProductModel resultProduct = result['product'];
    final String message = result['message'];

    state = [...state, resultProduct];
    return message;
  }

  Future<String> delete(int idProduct) async {
    final result = await _productAPI.delete(idProduct);

    List<ProductModel> tempList = [...state];

    tempList.removeWhere((element) => element.idProduct == idProduct);

    state = tempList;

    return result;
  }

  Future<String> update(
    int idProduct, {
    @required String name,
    @required double price,
    @required int stock,
    @required String summary,
    @required String description,
  }) async {
    final result = await _productAPI.update(
      idProduct,
      name: name,
      price: price,
      stock: stock,
      summary: summary,
      description: description,
    );

    final ProductModel product = result['product'];
    final String message = result['message'];

    state = [
      for (final existProduct in state)
        if (existProduct.idProduct == idProduct) product else existProduct
    ];
    return message;
  }

  Future<String> updateImage(int idProduct, {@required String image}) async {
    final result = await _productAPI.updateImage(
      idProduct,
      image: image,
    );
    final ProductModel product = result['product'];
    final String message = result['message'];

    state = [
      for (final existProduct in state)
        if (existProduct.idProduct == idProduct) product else existProduct
    ];
    return message;
  }

  Future<List<ProductModel>> getProducts() async {
    final products = await _productAPI.getAllProduct();
    var tempList = <ProductModel>[];
    for (var product in products) {
      tempList.add(product);
    }
    state = tempList;
    return products;
  }
}

final productProvider = StateNotifierProvider((ref) => ProductProvider());

final showProducts = FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final products = ref.watch(productProvider);
  final result = await products.getProducts();
  return result;
});

final singleProduct = StateProvider.autoDispose.family<ProductModel, int>((ref, idProduct) {
  final products = ref.watch(productProvider.state);
  final product = products.firstWhere((element) => element.idProduct == idProduct,
      orElse: () => ProductModel());
  return product;
});
