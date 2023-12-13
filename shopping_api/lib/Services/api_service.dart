import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_api/Model/product_model.dart';

class FetchProduct {
  final String apiUrl =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
  Future<List<Product>> fetchdata() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('error to load data');
    }
  }
}
