import 'package:dio/dio.dart';
import 'package:flutter_mockkit/flutter_mockkit.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/data/api/product_mock_api.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    ProductMockApi.registerMocks();

    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    )..interceptors.add(MockDioInterceptor());
  }

  @lazySingleton
  ProductMockApi productMockApi(Dio dio) => ProductMockApi(dio);
}
