import 'package:domain/modules/auth/auth_repository.dart';
import 'package:domain/modules/auth/use_cases/auth_login_use_case.dart';
import 'package:domain/modules/auth/use_cases/auth_refresh_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<AuthLoginUseCase>(() => AuthLoginUseCase(authRepository: dataDi<AuthRepository>()));

  dataDi.registerLazySingleton<AuthRefreshUseCase>(()=>AuthRefreshUseCase(authRepository: dataDi<AuthRepository>()));
}
