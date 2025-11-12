import 'package:domain/core/usecase.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class GetPaymentMethodUseCase extends UseCaseNoEitherNoStreamNullable<PaymentMethodEntity, GetPaymentMethodParams> {
  final UserInformationRepository userInformationRepository;

  GetPaymentMethodUseCase({required this.userInformationRepository});

  @override
  Future<PaymentMethodEntity?> call(params) async {
    return userInformationRepository.getPaymentMethod(params.userId);
  }
}

class GetPaymentMethodParams {
  final int userId;
  GetPaymentMethodParams({required this.userId});

}
