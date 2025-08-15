import '../../models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'countries_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class CountriesApiService{
  factory CountriesApiService(Dio dio, {String baseUrl})=_CountriesApiService;

  @GET('')
  Future<CountriesApiDto> getCountries();
}