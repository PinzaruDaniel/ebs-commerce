import 'package:dartz/dartz.dart';

import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';
import 'dart:async';

class GetProductsUseCase
    extends UseCaseStream<List<ProductEntity>, GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Stream<List<ProductEntity>> call(params) async* {
    final streamController = StreamController<List<ProductEntity>>();

    params.onCallBack!(false, false);
    productsRepository.getProductsLocalCache();
    streamController.stream.listen((data) {
      streamController.sink.add(data);
    });
    productsRepository
        .getProducts(params.page, params.perPage, params.marks)
        .then((data) {
          data.fold(
            (failure) {
              params.onCallBack!(true, true);
              return Left(failure);
            },
            (productsApi) async {
              params.onCallBack!(false, true);
              await productsRepository.setProductsLocalCache(productsApi);
              return Right(streamController.sink.add(productsApi));
            },
          );
        });

    yield* streamController.stream;
  }

  //TODO:productsRepository.getProductsLocalCache();  ->   //to call here with error false and fromApi false

  /*var either =   productsRepository.getProducts( params.page, params.perPage, params.marks);
  yeld*  either.fold(
       (failure) async{
         params.onCallBack!(true, true);
         //TODO:to call here with error true and fromApi true
         return Left(failure);
       },
       (newItems) async{
         await productsRepository.setProductsLocalCache(newItems);
         //TODO:to call here with error false and fromApi true
         params.onCallBack!(false, true);
         return Right(newItems);
       }
   );*/
}

class GetProductsParams {
  final int page;
  final int perPage;
  final String? marks;
  final Function(bool error, bool fromApi)? onCallBack;

  //o add callback to manage error on request
  GetProductsParams({
    required this.page,
    required this.perPage,
    this.marks,
    this.onCallBack,
  });
}
