import 'package:domain/core/usecase.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class SetPaymentMethodUseCase extends UseCaseNoEither<void, SetPaymentMethodParams> {
  final UserInformationRepository userInformationRepository;

  SetPaymentMethodUseCase({required this.userInformationRepository});

  @override
  Future<void> call(params) async {
    await userInformationRepository.setPaymentMethod(params.paymentMethodEntity);
  }
}

class SetPaymentMethodParams {
  final PaymentMethodEntity paymentMethodEntity;

  SetPaymentMethodParams({required this.paymentMethodEntity});
}
