import 'package:domain/modules/categories/use_cases/get_all_categories_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/category_mapper.dart';

import '../../../view/category_view_model.dart';

class CategoryController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase = GetIt.instance<GetAllCategoriesUseCase>();

  RxList<CategoryViewModel> categories = RxList([]);
  @override
  void onInit(){
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    await getAllCategoriesUseCase.call().then((either) async {
      either.fold((failure) {}, (categories) async {
        this.categories.value = categories.map((e) => e.toModel).toList();
      });
    });
  }
}
