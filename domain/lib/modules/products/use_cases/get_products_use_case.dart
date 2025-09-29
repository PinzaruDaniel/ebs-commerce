import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../models/index.dart';
import '../products_repository.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>,GetProductsParams> {
  final ProductsRepository productsRepository;

  GetProductsUseCase({required this.productsRepository});

  Future<Either<Failure, List<ProductEntity>>> call(params) async {
//TODO: init Stream, use controller to sync from cache and from api(to set)

  //get products from api:Left-failure, Right-List<ProductEntity
   var either = await  productsRepository.getProducts( params.page, params.perPage, params.marks);

  return  either.fold(
       (failure) async{
         return Left(failure);
       },
       (newItems) async{
         productsRepository.setProductsLocalCache(newItems);
         return Right(newItems);
       }
   );
  }
}

class GetProductsParams {

  final int page;
  final int perPage;
  final String? marks;
  GetProductsParams({required this.page, required this.perPage, this.marks});
}
