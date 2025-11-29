
import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

class GetDialCodesUseCase extends UseCaseNoParams<List<DialCodesEntity>>{
  final DeliveryAddressRepository dialCodesRepository;
  GetDialCodesUseCase({required this.dialCodesRepository});

  @override
  Future<Either<Failure, List<DialCodesEntity>>> call() async{
    return dialCodesRepository.getDialCodes();
  }
}