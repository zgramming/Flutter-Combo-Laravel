import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../model/models.dart';
import 'package:global_template/global_template.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static const _productUrl = 'produk/';
  Future<List<ProductModel>> getAllProduct() async {
    final List<ProductModel> result = await reusableRequestServer.requestServer(() async {
      final response = await http.get(
        appConfig.baseAPIURL + '/' + _productUrl + 'all',
        headers: appConfig.headersAPI,
      );
      final responseJson = json.decode(response.body);

      if (responseJson['status'] == "ok") {
        final List data = responseJson['data'];
        final List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw responseJson['message'];
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> insertProduct({
    @required String name,
    @required double price,
    @required int stock,
    @required String summary,
    @required String description,
    @required String imageProduct,
  }) async {
    final Map<String, dynamic> result = await reusableRequestServer.requestServer(() async {
      final response = await http.post(
        appConfig.baseAPIURL + '/' + _productUrl + 'insert',
        headers: appConfig.headersAPI,
        body: {
          "name": "$name",
          "price": "$price",
          "stock": "$stock",
          "summary": "$summary",
          "description": "$description",
          "image_product": "$imageProduct",
        },
      );
      final responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == "ok") {
        final Map<String, dynamic> data = responseJson['data'];
        final product = ProductModel.fromJson(data);

        return {
          "message": message,
          "product": product,
        };
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> updateImage(
    int idProduct, {
    @required String image,
  }) async {
    final Map<String, dynamic> result = await reusableRequestServer.requestServer(() async {
      final response = await http.put(
        appConfig.baseAPIURL + '/' + _productUrl + 'updateImage/$idProduct',
        headers: appConfig.headersAPI,
        body: {"image_product": "$image"},
      );
      final responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == "ok") {
        final Map<String, dynamic> data = responseJson['data'];
        final product = ProductModel.fromJson(data);

        return {
          "message": message,
          "product": product,
        };
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> update(
    int idProduct, {
    @required String name,
    @required double price,
    @required int stock,
    @required String summary,
    @required String description,
  }) async {
    final Map<String, dynamic> result = await reusableRequestServer.requestServer(() async {
      final response = await http.put(
        appConfig.baseAPIURL + '/' + _productUrl + 'update/$idProduct',
        headers: appConfig.headersAPI,
        body: {
          "name": "$name",
          "price": "$price",
          "stock": "$stock",
          "summary": "$summary",
          "description": "$description",
        },
      );
      final responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == "ok") {
        final Map<String, dynamic> data = responseJson['data'];
        final product = ProductModel.fromJson(data);

        return {
          "message": message,
          "product": product,
        };
      } else {
        throw message;
      }
    });
    return result;
  }

  Future<String> delete(int idProduct) async {
    final result = await reusableRequestServer.requestServer(() async {
      final response = await http.delete(
        appConfig.baseAPIURL + '/' + _productUrl + 'delete/$idProduct',
        headers: appConfig.headersAPI,
      );
      final responseJson = json.decode(response.body);
      final String message = responseJson['message'];
      if (responseJson['status'] == "ok") {
        return message;
      } else {
        throw message;
      }
    });
    return result;
  }
}
