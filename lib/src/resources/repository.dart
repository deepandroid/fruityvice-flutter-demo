import 'dart:async';

import 'package:fruityvice/src/models/iteam_model.dart';

import 'fruit_data_api.dart';

class Repository {
  final fruitsApiProvider = FruitDataProvider();

  Future<List<ItemModel>> fetchAllFruitData() async {
    return await fruitsApiProvider.fetchFruitList();
  }

  Future<ItemModel?> searchFruitName(String fruitName) =>
      fruitsApiProvider.searchFruit(fruitName);
}
