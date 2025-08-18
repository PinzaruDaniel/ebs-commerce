import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/remote/index.dart';

part 'delivery_address_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class DeliveryAddressApiService {
  factory DeliveryAddressApiService(Dio dio, {String baseUrl}) =
      _DeliveryAddressApiService;

  @GET('countries')
  Future<CountriesResponseApiDto> getCountries();

  @GET('countries/states/q')
  Future<StatesResponseApiDto> getStates(@Query('iso2') String country);

  @GET('countries/state/cities/q')
  Future<CitiesResponseApiDto> getCities(
      @Query('country')String country,
      @Query('state') String state,
      );



}
