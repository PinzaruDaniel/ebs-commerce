import 'package:data/modules/categories/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio, {String baseUrl}) = _CategoriesApiService;

  @GET('/categories')
  Future<CategoryResponseApiDto> getCategories(
      @Query('per_page') int? limit
      );
}
