import 'package:injectable/injectable.dart';
import 'package:my_shop/data/api/product_mock_api.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/story.dart';

@lazySingleton
class ProductRepository {
  ProductRepository(this._api);

  final ProductMockApi _api;

  Future<({List<Story> stories, List<Product> products})> getHome() async {
    final response = await _api.getHome();

    return (stories: response.stories, products: response.products);
  }
}
