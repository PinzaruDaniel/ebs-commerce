import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/countries/countries_repository.dart';
import 'package:domain/modules/countries/models/index.dart';

class GetCountriesUseCase extends UseCaseNoParams<CountriesEntity> {
  final CountriesRepository countriesRepository;

  GetCountriesUseCase({required this.countriesRepository});

  @override
  Future<Either<Failure, CountriesEntity>> call() async {
    return countriesRepository.getCountries();
  }
}
