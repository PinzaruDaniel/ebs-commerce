import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/cities_response_mapper.dart';
import 'package:data/modules/cities/models/remote/index.dart';
import 'package:data/modules/cities/sources/remote/cities_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/cities/cities_repository.dart';
import 'package:domain/modules/cities/models/index.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesApiService apiService;

  CitiesRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, CitiesResponseEntity>> getCities(country, state) async {
    try {
      final response = await apiService.getCities({'country': country, 'state': state});
      final entities = response.map((dto) => dto.toEntity);
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}
