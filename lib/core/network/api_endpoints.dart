class ApiEndpoints {
  static const String baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  // Products endpoints
  static const String getProducts = '/ListProductByRemark/popular';
  static const String getProductDetails = '/products/';
  static const String getCategories = '/CategoryList';

  // User endpoints
  static const String login = '/user/Login';
  static const String register = '/user/register';
  static const String profile = '/user/profile';

  // Cart endpoints
  static const String addToCart = '/cart';
  static const String getCart = '/cart';
  static const String removeFromCart = '/cart/';
}
