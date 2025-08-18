import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

class GetCountriesUseCase extends UseCaseNoParams<List<CountriesEntity>> {
  final DeliveryAddressRepository countriesRepository;

  GetCountriesUseCase({required this.countriesRepository});

  @override
  Future<Either<Failure, List<CountriesEntity>>> call() async {
    return countriesRepository.getCountries();
  }
}
