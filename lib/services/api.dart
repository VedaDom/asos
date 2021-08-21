import 'dart:convert';

import 'package:asos/models/cart_item.dart';
import 'package:asos/models/category.dart';
import 'package:asos/models/product.dart';
import 'package:asos/models/product_detail.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Map<String, String>? headers = {
    "x-rapidapi-key": "2ccda791a9mshcfd9136f5b996bep14f4bejsnc38c6e62b61a",
    "x-rapidapi-host": "asos2.p.rapidapi.com",
  };

  Future<List<ProductModel>>? getProducts(
    int categoryId, {
    int limit = 48,
    int offset = 0,
  }) async {
    var response = await http.get(
      Uri.parse(
        'https://asos2.p.rapidapi.com/products/v2/list?offset=$offset&limit=$limit&sort=freshness&categoryId=$categoryId&lang=en-US&country=RW',
      ),
      headers: headers,
    );
    var products = (json.decode(response.body)["products"] as List)
        .map((e) => ProductModel.fromJson(e));
    return products.toList();
  }

  Future<List<CategoryModel>>? getCategories() {
    // var response = await http.get(
    //   Uri.parse(
    //     'https://asos2.p.rapidapi.com/categories/list?lang=en-US&country=RW',
    //   ),
    //   headers: headers,
    // );
    // var body = json.decode(response.body);
    // body["navigation"][0]["children"][4]["children"][]
    return null;
  }

  Future<ProductDetailModel>? getProductDetails(int productId) async {
    var response = await http.get(
      Uri.parse(
        'https://asos2.p.rapidapi.com/products/v3/detail?id=$productId&lang=en-US&country=RW',
      ),
      headers: headers,
    );
    var body = json.decode(response.body);
    return ProductDetailModel.fromJson(body);
  }

  Future<List<CartItemModel>>? getMyCart(int productId) {
    return null;
  }

  Future<List<CartItemModel>>? getOrders(int uid) {
    return null;
  }
}
