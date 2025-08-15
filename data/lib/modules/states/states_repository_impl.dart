import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/states_mapper.dart';
import 'package:data/modules/states/models/remote/index.dart';
import 'package:data/modules/states/sources/remote/states_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/states/models/index.dart';
import 'package:domain/modules/states/states_repository.dart';

class StatesRepositoryImpl implements StatesRepository{
  final StatesApiService apiService;
  
  StatesRepositoryImpl({required this.apiService});
  
  @override 
  Future<Either<Failure, StatesEntity>> getStates(country) async{
    try{
      final response= await apiService.getStates({'country': country });
      final entities=response.map((dto)=>dto.toEntity);
      return Right(entities);
    } catch (e, stackTrace){
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}