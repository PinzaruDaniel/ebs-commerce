import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';
import 'dart:async';

class GetProductsUseCase extends UseCaseStream<List<ProductEntity>, GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Stream<List<ProductEntity>> call(params) async* {
    //TODO: initialize Stream, use stream controller to set from cache and from api(to set)
    final streamController = StreamController<List<ProductEntity>>();

    () async {
      final either = await productsRepository.getProducts(params.page, params.perPage, params.marks);

      either.fold(
        (failure) async {
          params.onCallBack!(true, true);
          final cacheStream = productsRepository.getProductsLocalCache();
          cacheStream.listen(
            (cachedProducts) {
              streamController.sink.add(cachedProducts);
              params.onCallBack!(false, false);
            },
            onError: (cacheError) => streamController.sink.addError(failure),
            onDone: () => streamController.close(),
          );
        },
        (newItems) async {
          await productsRepository.setProductsLocalCache(newItems);
          streamController.sink.add(newItems);
          params.onCallBack!(false, true);
          streamController.close();
        },
      );
    }();

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
  GetProductsParams({required this.page, required this.perPage, this.marks, this.onCallBack});
}
