import 'package:domain/modules/categories/categories_repository.dart';
import 'package:domain/modules/categories/use_cases/get_all_categories_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async{
  var dataDi = GetIt.instance;
  dataDi.registerLazySingleton<GetAllCategoriesUseCase>(
        () => GetAllCategoriesUseCase(categoriesRepository: dataDi<CategoriesRepository>()),
  );

}