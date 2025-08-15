import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/countries_mapper.dart';
import 'package:data/modules/countries/models/remote/index.dart';
import 'package:data/modules/countries/sources/remote/countries_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/countries/countries_repository.dart';
import 'package:domain/modules/countries/models/index.dart';

class CountriesRepositoryImpl implements CountriesRepository{
  final CountriesApiService apiService;

  CountriesRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, CountriesEntity>> getCountries() async{
    try{
      final response= await apiService.getCountries();
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