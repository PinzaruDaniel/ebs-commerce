import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/remote/index.dart';

part 'cities_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class CitiesApiService {
  factory CitiesApiService(Dio dio, {String baseUrl}) = _CitiesApiService;

  @POST('/state/cities')
  Future<CitiesResponseApiDto> getCities(@Body() Map<String, dynamic> body);
}
