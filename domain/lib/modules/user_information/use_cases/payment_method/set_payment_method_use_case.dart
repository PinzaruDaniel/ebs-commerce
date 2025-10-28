import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class SetPaymentMethodUseCase extends UseCaseNoEither<void, SetPaymentMethodParams>{
  final UserInformationRepository userInformationRepository;

  SetPaymentMethodUseCase({required this.userInformationRepository});
  Future<void> call(params)async{
    return userInformationRepository.setPaymentMethodLocalCache(params.paymentMethod);
  }
}

class SetPaymentMethodParams {
  final PaymentMethodEntity paymentMethod;
  SetPaymentMethodParams({required this.paymentMethod});
}