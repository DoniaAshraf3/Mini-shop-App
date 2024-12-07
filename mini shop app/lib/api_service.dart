import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
