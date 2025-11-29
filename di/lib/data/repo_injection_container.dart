import 'package:data/modules/auth/auth_repository_impl.dart';
import 'package:data/modules/auth/sources/local/auth_local_source.dart';
import 'package:data/modules/auth/sources/remote/auth_api_service.dart';
import 'package:data/modules/categories/categories_repository_impl.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:data/modules/delivery_address/delivery_address_repository_impl.dart';
import 'package:data/modules/delivery_address/sources/remote/delivery_address_api_service.dart';
import 'package:data/modules/products/products_repository_impl.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:data/modules/settings/settings_repository_impl.dart';
import 'package:data/modules/settings/sources/local/settings_local_source.dart';
import 'package:data/modules/user/sources/local/user_local_source.dart';
import 'package:data/modules/user/sources/remote/current_user_api_service.dart';
import 'package:data/modules/user/user_information_repository_impl.dart';
import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:domain/modules/settings/settings_repository.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;

  dataDi.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      apiService: dataDi<ProductsApiService>(),
      localDataSource: dataDi<ProductsLocalDataSource>(),
    ),
  );

  dataDi.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(apiService: dataDi<CategoriesApiService>()),
  );
  dataDi.registerLazySingleton<DeliveryAddressRepository>(
    () => DeliveryAddressRepositoryImpl(apiService: dataDi<DeliveryAddressApiService>()),
  );

  dataDi.registerLazySingleton<UserInformationRepository>(
    () => UserInformationRepositoryImpl(
      userLocalSource: dataDi<UserLocalSource>(),
      currentUserApiService: dataDi<CurrentUserApiService>(),
    ),
  );
  dataDi.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(settingsLocalSource: dataDi<SettingsLocalSource>()),
  );
  dataDi.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: dataDi<AuthApiService>(), localSource: dataDi<AuthLocalSource>()),
  );
}
