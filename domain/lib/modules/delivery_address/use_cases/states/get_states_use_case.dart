import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import '../../delivery_address_repository.dart';
import '../../models/index.dart';

class GetStatesUseCase extends UseCase<List<StatesEntity>, GetStatesUseCaseParams>{
  final DeliveryAddressRepository statesRepository;
  GetStatesUseCase({required this.statesRepository});

  @override
  Future<Either<Failure, List<StatesEntity>>> call(params) async {
    return statesRepository.getStates(params.country);
  }
}

class GetStatesUseCaseParams {
  String country;
  GetStatesUseCaseParams({required this.country});
}