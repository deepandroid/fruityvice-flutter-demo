import 'dart:async';
import 'dart:convert';

import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/util/app_constants.dart';
import 'package:http/http.dart' show Client, Response;

class FruitDataProvider {
  Client client = Client();

  Future<List<ItemModel>> fetchFruitList() async {
    Response response;
    response = await client
        .get(Uri.parse(AppConstants.BASE_URL + AppConstants.ALL_DATA));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var list = jsonDecode(jsonString) as List;
      List<ItemModel> menuList = [];
      for (int i = 0; i < list.length; i++) {
        menuList.add(ItemModel.fromJson(list[i]));
      }
      return menuList;
      //  return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(AppConstants.EROOR_MESSAGE);
    }
  }

  Future<ItemModel?> searchFruit(String fruitName) async {
    Response response;
    response = await client.get(Uri.parse(AppConstants.BASE_URL + fruitName));

    if (response.statusCode == 200) {
      if (AppConstants.historyList.isNotEmpty) {
        for (int i = 0; i < AppConstants.historyList.length; i++) {
          if (!AppConstants.historyList.contains(fruitName)) {
            AppConstants.historyList.add(fruitName);
          }
        }
      } else {
        AppConstants.historyList.add(fruitName);
      }
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      try {
        return ItemModel.fromJson(json.decode(response.body));
      } catch (e) {
        return ItemModel.fromJson(json.decode(response.body));
      }
    }
  }
}
