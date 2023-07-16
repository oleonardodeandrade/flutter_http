import 'dart:convert';

import 'package:flutter_animations/pages/data/http/exceptions.dart';
import 'package:flutter_animations/pages/data/http/http_client.dart';
import 'package:flutter_animations/pages/data/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}

class ProductRepository implements IProductRepository {
  final IHttpClient client;

  ProductRepository({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(url: 'https://dummyjson.com/products');

    if (response.statusCode == 200) {
      final List<ProductModel> products = [];

      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProductModel product = ProductModel.fromJson(item);
        products.add(product);
      }).toList();

      return products;
    } else if (response.statusCode == 404) {
      throw NotFoundException('The url is not found');
    } else {
      throw Exception("Don't possible to load products");
    }
  }
}
