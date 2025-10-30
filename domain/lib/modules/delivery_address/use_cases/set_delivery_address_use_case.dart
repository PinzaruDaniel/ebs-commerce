import 'package:domain/modules/user_information/user_information_repository.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';

class SetDeliveryAddressUseCase extends UseCaseNoEither<void, SetDeliveryAddressParams> {
  final UserInformationRepository userInformationRepository;

  SetDeliveryAddressUseCase({required this.userInformationRepository});

  Future<void> call(params) async {
    return userInformationRepository.setDeliveryAddress(params.deliveryAddressEntity);
  }
}

class SetDeliveryAddressParams {
  final DeliveryAddressEntity deliveryAddressEntity;

  SetDeliveryAddressParams({required this.deliveryAddressEntity});
}
