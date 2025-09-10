import 'package:ecommerce/core/network/api_client.dart';
import 'package:ecommerce/core/network/api_endpoints.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/product_model.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<Product>> getProducts() async {
    final response = await _apiClient.get(ApiEndpoints.getProducts);
    return (response['data'] as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
  Future<Product> getProductDetails(int productId)async{
    final response = await _apiClient.get(
        '${ApiEndpoints.getProductDetails}$productId'
    );
    return Product.fromJson(response['data']);
  }

  Future<List<Product>> getPopularProducts()async{
    final response = await _apiClient.get(ApiEndpoints.getProducts);
    return (response['data'] as List).map((json)=>Product.fromJson(json)).toList();
  }
  Future<List<Category>> getCategories()async{
    final response = await _apiClient.get(ApiEndpoints.getCategories);
    return (response['data'] as List)
        .map((json)=>Category.fromJson(json))
        .toList();
  }

}
