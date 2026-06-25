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

  @GET(ApiConstants.categoryProductsEndpoint)
  Future<List<Product>> getCategoryProducts(
    @Path(ApiConstants.categoryIdPathParameter) String categoryId,
  );

  static void registerMocks() {
    MockKit.enable();
    MockKit.registerAll([
      MockRoute(
        method: .get,
        path: ApiConstants.homePath,
        description: MockDataConstants.homeFeedDescription,
        response: MockResponse.ok({
          ApiFields.stories: [
            _story(1, LocalizationKeys.storyNew, RemoteImages.storyNew),
            _story(2, LocalizationKeys.storyDecor, RemoteImages.storyDecor),
            _story(
              3,
              LocalizationKeys.storyAccessories,
              RemoteImages.storyAccessories,
              isViewed: true,
            ),
            _story(
              4,
              LocalizationKeys.storyCare,
              RemoteImages.storyCare,
              isViewed: true,
            ),
          ],
          ApiFields.products: [
            _homeProduct(
              1,
              LocalizationKeys.productLamp,
              RemoteImages.productLamp,
              12500,
              isFavorite: true,
              isInCart: true,
            ),
            _homeProduct(
              2,
              LocalizationKeys.productCandle,
              RemoteImages.productCandle,
              3200,
              isFavorite: true,
            ),
            _homeProduct(
              3,
              LocalizationKeys.productLinen,
              RemoteImages.productLinen,
              8900,
              isFavorite: true,
            ),
            _homeProduct(
              4,
              LocalizationKeys.productBowl,
              RemoteImages.productBowl,
              5400,
              isFavorite: true,
              isInCart: true,
            ),
            _homeProduct(
              5,
              LocalizationKeys.productVase,
              RemoteImages.productVase,
              6700,
            ),
            _homeProduct(
              6,
              LocalizationKeys.productChair,
              RemoteImages.productChair,
              18900,
            ),
            _homeProduct(
              7,
              LocalizationKeys.productPerfume,
              RemoteImages.productPerfume,
              7800,
            ),
            _homeProduct(
              8,
              LocalizationKeys.productDecor,
              RemoteImages.productDecor,
              11200,
            ),
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
          final categoryId =
              request.pathParameters[ApiConstants.mockCategoryIdPathParameter];
          return MockResponse.ok(
            _categoryProducts[categoryId] ?? const [],
            delay: ApiConstants.mockDelay,
          );
        },
      ),
    ]);
  }

  static final List<Map<String, Object?>> _categories = [
    _category(
      MockDataConstants.clothingCategoryId,
      LocalizationKeys.categoryClothing,
    ),
    _category(
      MockDataConstants.shoesCategoryId,
      LocalizationKeys.categoryShoes,
    ),
    _category(
      MockDataConstants.accessoriesCategoryId,
      LocalizationKeys.categoryAccessories,
    ),
    _category(
      MockDataConstants.electronicsCategoryId,
      LocalizationKeys.categoryElectronics,
    ),
    _category(
      MockDataConstants.booksCategoryId,
      LocalizationKeys.categoryBooks,
    ),
    _category(MockDataConstants.homeCategoryId, LocalizationKeys.categoryHome),
  ];

  static final Map<String, List<Map<String, Object?>>> _categoryProducts = {
    MockDataConstants.clothingCategoryId: [
      _product(
        MockDataConstants.clothingCategoryId,
        1,
        LocalizationKeys.catalogLinenShirt,
        4900,
      ),
      _product(
        MockDataConstants.clothingCategoryId,
        2,
        LocalizationKeys.catalogWoolCoat,
        18900,
      ),
      _product(
        MockDataConstants.clothingCategoryId,
        3,
        LocalizationKeys.catalogSilkDress,
        12700,
      ),
      _product(
        MockDataConstants.clothingCategoryId,
        4,
        LocalizationKeys.catalogCottonTrousers,
        6500,
      ),
    ],
    MockDataConstants.shoesCategoryId: [
      _product(
        MockDataConstants.shoesCategoryId,
        1,
        LocalizationKeys.catalogLeatherSneakers,
        9200,
      ),
      _product(
        MockDataConstants.shoesCategoryId,
        2,
        LocalizationKeys.catalogClassicLoafers,
        11800,
      ),
      _product(
        MockDataConstants.shoesCategoryId,
        3,
        LocalizationKeys.catalogSuedeBoots,
        15400,
      ),
      _product(
        MockDataConstants.shoesCategoryId,
        4,
        LocalizationKeys.catalogMinimalSandals,
        7300,
      ),
    ],
    MockDataConstants.accessoriesCategoryId: [
      _product(
        MockDataConstants.accessoriesCategoryId,
        1,
        LocalizationKeys.catalogLeatherBag,
        14200,
      ),
      _product(
        MockDataConstants.accessoriesCategoryId,
        2,
        LocalizationKeys.catalogGoldEarrings,
        8600,
      ),
      _product(
        MockDataConstants.accessoriesCategoryId,
        3,
        LocalizationKeys.catalogSilkScarf,
        4200,
      ),
      _product(
        MockDataConstants.accessoriesCategoryId,
        4,
        LocalizationKeys.catalogClassicWatch,
        21900,
      ),
    ],
    MockDataConstants.electronicsCategoryId: [
      _product(
        MockDataConstants.electronicsCategoryId,
        1,
        LocalizationKeys.catalogWirelessHeadphones,
        13900,
      ),
      _product(
        MockDataConstants.electronicsCategoryId,
        2,
        LocalizationKeys.catalogSmartSpeaker,
        9900,
      ),
      _product(
        MockDataConstants.electronicsCategoryId,
        3,
        LocalizationKeys.catalogCompactCamera,
        28900,
      ),
      _product(
        MockDataConstants.electronicsCategoryId,
        4,
        LocalizationKeys.catalogPortableCharger,
        3900,
      ),
    ],
    MockDataConstants.booksCategoryId: [
      _product(
        MockDataConstants.booksCategoryId,
        1,
        LocalizationKeys.catalogDesignBook,
        2800,
      ),
      _product(
        MockDataConstants.booksCategoryId,
        2,
        LocalizationKeys.catalogArchitectureAlbum,
        4600,
      ),
      _product(
        MockDataConstants.booksCategoryId,
        3,
        LocalizationKeys.catalogArtHistory,
        3500,
      ),
      _product(
        MockDataConstants.booksCategoryId,
        4,
        LocalizationKeys.catalogModernInteriors,
        3100,
      ),
    ],
    MockDataConstants.homeCategoryId: [
      _product(
        MockDataConstants.homeCategoryId,
        1,
        LocalizationKeys.catalogCeramicVase,
        2400,
      ),
      _product(
        MockDataConstants.homeCategoryId,
        2,
        LocalizationKeys.catalogAmberCandles,
        1850,
      ),
      _product(
        MockDataConstants.homeCategoryId,
        3,
        LocalizationKeys.catalogGeometryPoster,
        3200,
      ),
      _product(
        MockDataConstants.homeCategoryId,
        4,
        LocalizationKeys.catalogJuteBasket,
        1100,
      ),
    ],
  };

  static Map<String, Object?> _story(
    int index,
    String titleKey,
    String imageUrl, {
    bool isViewed = false,
  }) {
    return {
      ApiFields.id: _id(MockDataConstants.storyIdPrefix, index),
      ApiFields.titleKey: titleKey,
      ApiFields.imageUrl: imageUrl,
      ApiFields.isViewed: isViewed,
    };
  }

  static Map<String, Object?> _homeProduct(
    int index,
    String titleKey,
    String imageUrl,
    int price, {
    bool isFavorite = false,
    bool isInCart = false,
  }) {
    return {
      ApiFields.id: _id(MockDataConstants.productIdPrefix, index),
      ApiFields.titleKey: titleKey,
      ApiFields.imageUrl: imageUrl,
      ApiFields.price: price,
      ApiFields.isFavorite: isFavorite,
      ApiFields.isInCart: isInCart,
    };
  }

  static Map<String, Object?> _category(String id, String titleKey) {
    return {ApiFields.id: id, ApiFields.titleKey: titleKey, ApiFields.icon: id};
  }

  static Map<String, Object?> _product(
    String categoryId,
    int index,
    String titleKey,
    int price,
  ) {
    return {
      ApiFields.id: _id(categoryId, index),
      ApiFields.titleKey: titleKey,
      ApiFields.imageUrl: RemoteImages.common,
      ApiFields.price: price,
      ApiFields.isFavorite: false,
      ApiFields.isInCart: false,
    };
  }

  static String _id(String prefix, int index) =>
      '$prefix${MockDataConstants.idSeparator}$index';
}
