
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/delivery_address/use_cases/cities/get_cities_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/countries/get_countries_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/states/get_states_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async{
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<GetCitiesUseCase>(
        () => GetCitiesUseCase(citiesRepository: dataDi<DeliveryAddressRepository>()),
  );

  dataDi.registerLazySingleton<GetStatesUseCase>(
        () => GetStatesUseCase(statesRepository: dataDi<DeliveryAddressRepository>()),
  );
  dataDi.registerLazySingleton<GetCountriesUseCase>(
        () => GetCountriesUseCase(countriesRepository: dataDi<DeliveryAddressRepository>()),
  );

}