import 'package:dio/dio.dart';
import 'package:flutter_mockkit/flutter_mockkit.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/domain/entities/home_feed.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_mock_api.g.dart';

@RestApi()
abstract class ProductMockApi {
  factory ProductMockApi(Dio dio) = _ProductMockApi;

  @GET(ApiConstants.homePath)
  Future<HomeFeed> getHome();

  @GET(ApiConstants.categoriesPath)
  Future<List<Category>> getCategories();

  @GET('/categories/{categoryId}/products')
  Future<List<Product>> getCategoryProducts(
    @Path('categoryId') String categoryId,
  );

  static void registerMocks() {
    MockKit.enable();
    MockKit.registerAll([
      MockRoute(
        method: .get,
        path: ApiConstants.homePath,
        description: 'MyShop home feed',
        response: MockResponse.ok({
          'stories': [
            {
              'id': 'story-1',
              'titleKey': 'storyNew',
              'imageUrl': RemoteImages.storyNew,
              'isViewed': false,
            },
            {
              'id': 'story-2',
              'titleKey': 'storyDecor',
              'imageUrl': RemoteImages.storyDecor,
              'isViewed': false,
            },
            {
              'id': 'story-3',
              'titleKey': 'storyAccessories',
              'imageUrl': RemoteImages.storyAccessories,
              'isViewed': true,
            },
            {
              'id': 'story-4',
              'titleKey': 'storyCare',
              'imageUrl': RemoteImages.storyCare,
              'isViewed': true,
            },
          ],
          'products': [
            {
              'id': 'product-1',
              'titleKey': 'productLamp',
              'imageUrl': RemoteImages.productLamp,
              'price': 12500,
              'isFavorite': true,
              'isInCart': true,
            },
            {
              'id': 'product-2',
              'titleKey': 'productCandle',
              'imageUrl': RemoteImages.productCandle,
              'price': 3200,
              'isFavorite': true,
              'isInCart': false,
            },
            {
              'id': 'product-3',
              'titleKey': 'productLinen',
              'imageUrl': RemoteImages.productLinen,
              'price': 8900,
              'isFavorite': true,
              'isInCart': false,
            },
            {
              'id': 'product-4',
              'titleKey': 'productBowl',
              'imageUrl': RemoteImages.productBowl,
              'price': 5400,
              'isFavorite': true,
              'isInCart': true,
            },
            {
              'id': 'product-5',
              'titleKey': 'productVase',
              'imageUrl': RemoteImages.productVase,
              'price': 6700,
              'isFavorite': false,
              'isInCart': false,
            },
            {
              'id': 'product-6',
              'titleKey': 'productChair',
              'imageUrl': RemoteImages.productChair,
              'price': 18900,
              'isFavorite': false,
              'isInCart': false,
            },
            {
              'id': 'product-7',
              'titleKey': 'productPerfume',
              'imageUrl': RemoteImages.productPerfume,
              'price': 7800,
              'isFavorite': false,
              'isInCart': false,
            },
            {
              'id': 'product-8',
              'titleKey': 'productDecor',
              'imageUrl': RemoteImages.productDecor,
              'price': 11200,
              'isFavorite': false,
              'isInCart': false,
            },
          ],
        }, delay: ApiConstants.mockDelay),
      ),
      MockRoute(
        method: .get,
        path: ApiConstants.categoriesPath,
        response: MockResponse.ok(_categories, delay: ApiConstants.mockDelay),
      ),
      MockRoute(
        method: .get,
        path: ApiConstants.categoryProductsPath,
        responseBuilder: (request) {
          final categoryId = request.pathParameters['id'];
          return MockResponse.ok(
            _categoryProducts[categoryId] ?? const [],
            delay: ApiConstants.mockDelay,
          );
        },
      ),
    ]);
  }

  static const List<Map<String, Object?>> _categories = [
    {'id': 'clothing', 'titleKey': 'categoryClothing', 'icon': 'clothing'},
    {'id': 'shoes', 'titleKey': 'categoryShoes', 'icon': 'shoes'},
    {
      'id': 'accessories',
      'titleKey': 'categoryAccessories',
      'icon': 'accessories',
    },
    {
      'id': 'electronics',
      'titleKey': 'categoryElectronics',
      'icon': 'electronics',
    },
    {'id': 'books', 'titleKey': 'categoryBooks', 'icon': 'books'},
    {'id': 'home', 'titleKey': 'categoryHome', 'icon': 'home'},
  ];

  static final Map<String, List<Map<String, Object?>>> _categoryProducts = {
    'clothing': [
      _product('clothing-1', 'catalogLinenShirt', 4900),
      _product('clothing-2', 'catalogWoolCoat', 18900),
      _product('clothing-3', 'catalogSilkDress', 12700),
      _product('clothing-4', 'catalogCottonTrousers', 6500),
    ],
    'shoes': [
      _product('shoes-1', 'catalogLeatherSneakers', 9200),
      _product('shoes-2', 'catalogClassicLoafers', 11800),
      _product('shoes-3', 'catalogSuedeBoots', 15400),
      _product('shoes-4', 'catalogMinimalSandals', 7300),
    ],
    'accessories': [
      _product('accessories-1', 'catalogLeatherBag', 14200),
      _product('accessories-2', 'catalogGoldEarrings', 8600),
      _product('accessories-3', 'catalogSilkScarf', 4200),
      _product('accessories-4', 'catalogClassicWatch', 21900),
    ],
    'electronics': [
      _product('electronics-1', 'catalogWirelessHeadphones', 13900),
      _product('electronics-2', 'catalogSmartSpeaker', 9900),
      _product('electronics-3', 'catalogCompactCamera', 28900),
      _product('electronics-4', 'catalogPortableCharger', 3900),
    ],
    'books': [
      _product('books-1', 'catalogDesignBook', 2800),
      _product('books-2', 'catalogArchitectureAlbum', 4600),
      _product('books-3', 'catalogArtHistory', 3500),
      _product('books-4', 'catalogModernInteriors', 3100),
    ],
    'home': [
      _product('home-1', 'catalogCeramicVase', 2400),
      _product('home-2', 'catalogAmberCandles', 1850),
      _product('home-3', 'catalogGeometryPoster', 3200),
      _product('home-4', 'catalogJuteBasket', 1100),
    ],
  };

  static Map<String, Object?> _product(String id, String titleKey, int price) {
    return {
      'id': id,
      'titleKey': titleKey,
      'imageUrl': RemoteImages.common,
      'price': price,
      'isFavorite': false,
      'isInCart': false,
    };
  }
}
