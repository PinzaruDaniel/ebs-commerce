import 'package:domain/modules/delivery_address/use_cases/get_delivery_address_cache_use_case.dart';
import 'package:domain/modules/delivery_address/use_cases/set_delivery_address_use_case.dart';
import 'package:domain/modules/payment_method/use_cases/get_payment_method_use_case.dart';
import 'package:domain/modules/payment_method/use_cases/set_payment_method_use_case.dart';
import 'package:domain/modules/user_information/use_cases/sync_user_use_case.dart';
import 'package:domain/modules/user_information/use_cases/stream_user_use_case.dart';
import 'package:domain/modules/user_information/use_cases/set_user_use_case.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<SetUserUseCase>(
    () => SetUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<StreamUserUseCase>(
    () => StreamUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<SyncUserUseCase>(
    () => SyncUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.registerLazySingleton<SetDeliveryAddressUseCase>(
    () => SetDeliveryAddressUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<GetDeliveryAddressUseCase>(
    () => GetDeliveryAddressUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.registerLazySingleton<SetPaymentMethodUseCase>(
    () => SetPaymentMethodUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<GetPaymentMethodUseCase>(
    () => GetPaymentMethodUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
}
