import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/states/models/index.dart';
import 'package:domain/modules/states/states_repository.dart';

class GetStatesUseCase extends UseCase<StatesEntity, GetStatesUseCaseParams>{
  final StatesRepository statesRepository;
  GetStatesUseCase({required this.statesRepository});

  @override
  Future<Either<Failure, StatesEntity>>call(params)async{
  return statesRepository.getStates(
    params.country,
  );
  }
}

class GetStatesUseCaseParams {
  String country;
  GetStatesUseCaseParams({required this.country});
}