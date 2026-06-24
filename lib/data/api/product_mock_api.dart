import 'package:dio/dio.dart';
import 'package:flutter_mockkit/flutter_mockkit.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/home_feed.dart';
import 'package:retrofit/retrofit.dart';

part 'product_mock_api.g.dart';

@RestApi()
abstract class ProductMockApi {
  factory ProductMockApi(Dio dio) = _ProductMockApi;

  @GET(ApiConstants.homePath)
  Future<HomeFeed> getHome();

  static void registerMocks() {
    MockKit.enable();
    MockKit.register(
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
              'isInCart': false,
            },
            {
              'id': 'product-2',
              'titleKey': 'productCandle',
              'imageUrl': RemoteImages.productCandle,
              'price': 3200,
              'isFavorite': false,
              'isInCart': false,
            },
            {
              'id': 'product-3',
              'titleKey': 'productLinen',
              'imageUrl': RemoteImages.productLinen,
              'price': 8900,
              'isFavorite': false,
              'isInCart': false,
            },
            {
              'id': 'product-4',
              'titleKey': 'productBowl',
              'imageUrl': RemoteImages.productBowl,
              'price': 5400,
              'isFavorite': true,
              'isInCart': false,
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
    );
  }
}
