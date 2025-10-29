import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class GetDeliveryAddressUseCase extends UseCaseNoEitherNoParamsNoStream<DeliveryAddressEntity>{
  final UserInformationRepository userInformationRepository;
  GetDeliveryAddressUseCase({required this.userInformationRepository});

  @override
  Future<DeliveryAddressEntity> call(){
    return userInformationRepository.getDeliveryAddressLocalCache();
  }
}