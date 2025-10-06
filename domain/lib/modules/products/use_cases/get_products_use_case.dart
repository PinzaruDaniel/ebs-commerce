import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';
import 'dart:async';

class GetProductsUseCase extends UseCaseStream<List<ProductEntity>, GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Stream<List<ProductEntity>> call(params) async* {
    final streamController = StreamController<List<ProductEntity>>();
    productsRepository.getProductsLocalCache().distinct().listen((event) {
      streamController.sink.add(event);
      print('get local cache ${event.length}');
    });
    productsRepository.getProducts(params.page, params.perPage, params.marks).then((data) {
      data.fold(
        (failure) {
          return Left(failure);
        },
        (productsApi) {
          print('get from api ${productsApi.length}');
          streamController.sink.add(productsApi);
          return Right(productsApi);
        },
      );
    });
    yield* streamController.stream;
  }
}

class GetProductsParams {
  final int page;
  final int perPage;
  final String? marks;
  final Function({required bool error, required bool fromApi})? onCallBack;

  GetProductsParams({required this.page, required this.perPage, this.marks, this.onCallBack});
}
