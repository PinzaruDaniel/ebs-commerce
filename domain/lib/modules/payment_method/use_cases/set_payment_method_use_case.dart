import 'package:domain/core/usecase.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class SetPaymentMethodUseCase extends UseCaseNoEither<void, SetPaymentMethodParams> {
  final UserInformationRepository userInformationRepository;

  SetPaymentMethodUseCase({required this.userInformationRepository});

  @override
  Future<void> call(params) async {
    await userInformationRepository.setPaymentMethod(userId: params.userId, paymentMethod: params.paymentMethodEntity);
  }
}

class SetPaymentMethodParams {
  final PaymentMethodEntity paymentMethodEntity;
  final int userId;

  SetPaymentMethodParams({required this.paymentMethodEntity, required this.userId});
}
