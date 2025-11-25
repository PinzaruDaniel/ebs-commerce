import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/remote/index.dart';

part 'delivery_address_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class DeliveryAddressApiService {
  factory DeliveryAddressApiService(Dio dio, {String baseUrl}) = _DeliveryAddressApiService;

  @GET('countries')
  Future<List<CountriesApiDto>> getCountries();

  @GET('countries/{iso2}/states')
  Future<List<StatesApiDto>> getStates(@Path('iso2') String countryIso2);

  @GET('countries/{countryIso2}/states/{stateIso2}/cities')
  Future<List<CitiesResponseApiDto>> getCities(@Path('countryIso2') String countryIso2, @Path('stateIso2') String stateIso2);
}
