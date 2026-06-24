abstract final class ApiConstants {
  static const String baseUrl = 'https://api.myshop.local';
  static const String homePath = '/home';
  static const String categoriesPath = '/categories';
  static const String categoryProductsPath = '/categories/:id/products';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration mockDelay = Duration(milliseconds: 900);
}
