import 'package:domain/modules/user_information/use_cases/user/set_user_use_case.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<SetUserUseCase>(
    () => SetUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.register
}
