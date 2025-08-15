
import 'package:domain/modules/cities/use_case/get_cities_use_case.dart';
import 'package:domain/modules/cities/cities_repository.dart';
import 'package:domain/modules/countries/countries_repository.dart';
import 'package:domain/modules/countries/use_case/get_countries_use_case.dart';
import 'package:domain/modules/states/states_repository.dart';
import 'package:domain/modules/states/use_case/get_states_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async{
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<GetCitiesUseCase>(
        () => GetCitiesUseCase(citiesRepository: dataDi<CitiesRepository>()),
  );

  dataDi.registerLazySingleton<GetStatesUseCase>(
        () => GetStatesUseCase(statesRepository: dataDi<StatesRepository>()),
  );
  dataDi.registerLazySingleton<GetCountriesUseCase>(
        () => GetCountriesUseCase(countriesRepository: dataDi<CountriesRepository>()),
  );

}