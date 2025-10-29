import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class SetDeliveryAddressUseCase extends UseCaseNoEither<void, SetDeliveryAddressParams> {
  final UserInformationRepository userInformationRepository;

  SetDeliveryAddressUseCase({required this.userInformationRepository});

  @override
  Future<void> call(params) async {
    return userInformationRepository.setDeliveryAddressLocalCache(params.deliveryAddress);
  }
}

class SetDeliveryAddressParams {
  final DeliveryAddressEntity deliveryAddress;

  SetDeliveryAddressParams({required this.deliveryAddress});
}
