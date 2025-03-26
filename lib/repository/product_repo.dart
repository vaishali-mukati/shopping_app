import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ProductRepository{
  final Dio _dio = Dio();
  String baseurl = 'https://dummyjson.com/products';
  Future<List<ProductModel>> fetchProducts(int limit,int skip) async{
      final response = await _dio.get(baseurl,queryParameters: {
        'limit':limit,
        'skip':skip,
      });

      if(response.statusCode == 200){
        List<ProductModel> products = (response.data['products'] as List).map((json) => ProductModel.fromJson(json)).toList();
        return products;
      }else{
        throw Exception('Failed to load messages');
      }
  }
}