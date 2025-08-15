import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/cities/cities_repository_impl.dart';
import 'package:data/modules/cities/sources/remote/cities_api_service.dart';
import 'package:data/modules/countries/countries_repository_impl.dart';
import 'package:data/modules/countries/sources/remote/countries_api_service.dart';
import 'package:data/modules/products/products_repository_impl.dart';
import 'package:data/modules/categories/categories_repository_impl.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:data/modules/states/sources/remote/states_api_service.dart';
import 'package:domain/modules/cities/cities_repository.dart';
import 'package:domain/modules/countries/countries_repository.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:domain/modules/states/states_repository.dart';
import 'package:data/modules/states/states_repository_impl.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(apiService: dataDi<ProductsApiService>()),
  );

  dataDi.registerLazySingleton<CategoriesRepository>(
      ()=>CategoriesRepositoryImpl(apiService: dataDi<CategoriesApiService>()),
  );


  //Addresses
  dataDi.registerLazySingleton<CountriesRepository>(
        ()=>CountriesRepositoryImpl(apiService: dataDi<CountriesApiService>()),
  );
  dataDi.registerLazySingleton<StatesRepository>(
        ()=>StatesRepositoryImpl(apiService: dataDi<StatesApiService>()),
  );
  dataDi.registerLazySingleton<CitiesRepository>(
        ()=>CitiesRepositoryImpl(apiService: dataDi<CitiesApiService>()),
  );
}
