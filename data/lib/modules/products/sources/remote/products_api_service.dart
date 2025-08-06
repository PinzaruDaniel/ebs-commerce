import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/remote/index.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET('/products')
  Future<ProductResponseApiDto> getProducts(
    @Query('marks') String? mark,
    @Query('page') int? page,
    @Query('per_page') int? limit
  );
}
