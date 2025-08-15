import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/cities/cities_repository.dart';
import 'package:domain/modules/cities/models/index.dart';

class GetCitiesUseCase extends UseCase<CitiesResponseEntity, GetCitiesUseCaseParams>{

  final CitiesRepository citiesRepository;
  GetCitiesUseCase({required this.citiesRepository});

  @override
  Future<Either<Failure, CitiesResponseEntity>> call(params) async{
    return citiesRepository.getCities(
      params.country,
      params.state,
    );
  }
}


class GetCitiesUseCaseParams {
  String country;
  String state;
  GetCitiesUseCaseParams({required this.country, required this.state});
}