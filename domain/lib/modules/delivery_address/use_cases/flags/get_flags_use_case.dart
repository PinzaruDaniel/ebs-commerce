import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

class GetFlagsUseCase extends UseCaseNoParams<List<FlagEntity>>{
  final DeliveryAddressRepository flagsRepository;
  GetFlagsUseCase({required this.flagsRepository});

  @override
  Future<Either<Failure, List<FlagEntity>>> call() async{
    return flagsRepository.getFlags();
  }
}