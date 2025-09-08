import 'package:domain/modules/categories/use_cases/get_all_categories_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/util/mapper/category_mapper.dart';

import '../../../view/category_view_model.dart';

class CategoryController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase = GetIt.instance<GetAllCategoriesUseCase>();

  RxList<CategoryViewModel> categories = RxList([]);
  RxMap<int?, List<CategoryViewModel>> groupedCategories = <int?, List<CategoryViewModel>>{}.obs;
  final RxSet<int> selectedCategoryId = <int>{}.obs;

  RxBool isLoading = RxBool(true);

  void getCategories() async {
    await getAllCategoriesUseCase.call().then((either) async {
      either.fold((failure) {}, (categories) async {
        final models = categories.map((e) => e.toModel).toList();
        this.categories.value = models;
        groupedCategories.value = groupByParent(models);
      });
    });
    isLoading.value = false;
  }

  Map<int?, List<CategoryViewModel>> groupByParent(List<CategoryViewModel> categories) {
    final Map<int?, List<CategoryViewModel>> map = {};
    for (var cat in categories) {
      map.putIfAbsent(cat.parent, () => []).add(cat);
    }
    return map;
  }

  bool? getCategorySelectionState(int categoryId) {
    final children = groupedCategories[categoryId];
    if (children == null || children.isEmpty) {
      return selectedCategoryId.contains(categoryId);
    }

    int selectedCount = 0;
    for (var child in children) {
      final state = getCategorySelectionState(child.id);
      if (state == true) {
        selectedCount++;
      } else if (state == null) {
        return null;
      }
    }

    if (selectedCount == 0) {
      return false;
    } else if (selectedCount == children.length) {
      return true;
    } else {
      return null;
    }
  }

  void toggleCategoryRecursive(int id, bool selected) {
    toggleCategory(id, selected);

    if (groupedCategories.containsKey(id)) {
      for (var child in groupedCategories[id]!) {
        toggleCategoryRecursive(child.id, selected);
      }
    }
  }

  void toggleCategory(int id, bool? selected) {
    if (selected == true) {
      selectedCategoryId.add(id);
    } else if (selected == false) {
      selectedCategoryId.remove(id);
    } else {
      return;
    }
  }

  void clearCategories() => selectedCategoryId.clear();
}
