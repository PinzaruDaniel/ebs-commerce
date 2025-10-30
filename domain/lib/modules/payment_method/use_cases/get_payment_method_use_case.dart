import 'package:domain/core/usecase.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class GetPaymentMethodUseCase extends UseCaseNoEitherNoParamsNoStreamNullable<PaymentMethodEntity> {
  final UserInformationRepository userInformationRepository;

  GetPaymentMethodUseCase({required this.userInformationRepository});

  @override
  Future<PaymentMethodEntity?> call() async {
    return userInformationRepository.getPaymentMethod();
  }
}
