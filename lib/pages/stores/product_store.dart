import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/data/http/exceptions.dart';
import 'package:flutter_animations/pages/data/models/product_model.dart';
import 'package:flutter_animations/pages/data/repositories/product_repository.dart';

class ProductStore {
  final IProductRepository repository;

  //loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //state
  final ValueNotifier<List<ProductModel>> state =
      ValueNotifier<List<ProductModel>>([]);

  //error
  final ValueNotifier<String> error = ValueNotifier<String>("");

  ProductStore({required this.repository});

  getProducts() async {
    isLoading.value = true;

    try {
      final result = await repository.getProducts();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
