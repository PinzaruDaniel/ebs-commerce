import 'package:domain/modules/user_information/use_cases/delivery_address/get_delivery_address_use_case.dart';
import 'package:domain/modules/user_information/use_cases/delivery_address/set_delivery_address_use_case.dart';
import 'package:domain/modules/user_information/use_cases/payment_method/get_payment_method_use_case.dart';
import 'package:domain/modules/user_information/use_cases/payment_method/set_payment_method_use_case.dart';
import 'package:domain/modules/user_information/use_cases/user/set_user_use_case.dart';
import 'package:domain/modules/user_information/use_cases/user/get_user_use_case.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<SetUserUseCase>(
    () => SetUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.registerLazySingleton<SetPaymentMethodUseCase>(
    () => SetPaymentMethodUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<GetPaymentMethodUseCase>(
    () => GetPaymentMethodUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );

  dataDi.registerLazySingleton<SetDeliveryAddressUseCase>(
    () => SetDeliveryAddressUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );
  dataDi.registerLazySingleton<GetDeliveryAddressUseCase>(
    () => GetDeliveryAddressUseCase(userInformationRepository: dataDi<UserInformationRepository>()),
  );



}
