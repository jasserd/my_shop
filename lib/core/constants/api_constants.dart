abstract final class ApiConstants {
  static const baseUrl = 'https://api.myshop.local';
  static const homePath = '/home';
  static const categoriesPath = '/categories';
  static const categoryProductsEndpoint = '/categories/{categoryId}/products';
  static const categoryProductsPath = '/categories/:id/products';
  static const categoryIdPathParameter = 'categoryId';
  static const mockCategoryIdPathParameter = 'id';
  static const connectTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 15);
  static const mockDelay = Duration(milliseconds: 900);
}
