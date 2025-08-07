import 'package:domain/modules/categories/use_cases/get_all_categories_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/category_mapper.dart';

import '../../../view/category_view_model.dart';

class CategoryController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase = GetIt.instance<GetAllCategoriesUseCase>();

  RxList<CategoryViewModel> categories = RxList([]);
  RxMap<int?, List<CategoryViewModel>> groupedCategories=<int?, List<CategoryViewModel>>{}.obs;
  @override
  void onInit(){
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    await getAllCategoriesUseCase.call().then((either) async {
      either.fold((failure) {}, (categories) async {
        final models = categories.map((e) => e.toModel).toList();
        this.categories.value=models;
        groupedCategories.value=groupByParent(models);
      });
    });
  }
  Map<int?, List<CategoryViewModel>> groupByParent(List<CategoryViewModel> categories){
    final Map<int?, List<CategoryViewModel>>map={};
    for(var cat in categories){
      map.putIfAbsent(cat.parent, ()=>[]).add(cat);
    }
    return map;
  }
}
