import 'package:domain/modules/products/use_cases/get_filtered_products_count_use_case.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../view/category_view_model.dart';

class FilterController extends GetxController {
  final GetFilteredProductsCountUseCase getFilteredProductsCountUseCase =
      GetIt.instance<GetFilteredProductsCountUseCase>();
  final RxSet<int> selectedCategoryId = <int>{}.obs;
  final RxList<CategoryViewModel> categories = RxList([]);

  final RxList<ProductViewModel> filteredProducts = RxList([]);
  RxBool isLoading = true.obs;

  final RxDouble minPrice = 1.0.obs;
  final RxDouble maxPrice = 50000.0.obs;
  final Rx<SfRangeValues> priceRange = SfRangeValues(1.0, 50000.0).obs;
  final RxInt filteredCount = 0.obs;

  void initItems() {
    getFilteredProductsCount(page: 1);
    debounce<SfRangeValues>(priceRange, (_) => getFilteredProductsCount(page: 1), time: Duration(seconds: 1));
    debounce<Set<int>>(selectedCategoryId, (_) => getFilteredProductsCount(page: 1), time: Duration(milliseconds: 2));
  }

  void setCategoryData({required Set<int> selectedIds, required List<CategoryViewModel> allCategories}) {
    selectedCategoryId.value = Set.from(selectedIds);
    categories.value = List.from(allCategories);
  }

  GetFilteredProductsParams getFilteredProductsParams() {
    final min = priceRange.value.start.toDouble();
    final max = priceRange.value.end.toDouble();
    final categories = selectedCategoryId.toList();
    return GetFilteredProductsParams(
      page: 1,
      priceGte: min,
      priceLte: max,
      categoriesId: categories.isNotEmpty ? categories : null,
    );
  }

  Future<void> getFilteredProductsCount({required int page}) async {
    isLoading.value = true;

    final min = priceRange.value.start.toDouble();
    final max = priceRange.value.end.toDouble();
    final categories = selectedCategoryId.toList();

    final result = await getFilteredProductsCountUseCase.call(
      GetFilteredProductsCountParams(
        page: page,
        priceGte: min,
        priceLte: max,
        categoriesId: categories.isNotEmpty ? categories : null,
      ),
    );

    result.fold(
      (failure) {
        filteredCount.value = 0;
      },
      (responseEntity) {
        filteredCount.value = responseEntity;
      },
    );

    isLoading.value = false;
  }

  void onRangeChanged(SfRangeValues v) => priceRange.value = v;

  void onRangeChangeEnd(SfRangeValues v) => priceRange.value = v;

  void toggleCategory(int id, bool isSelected) {
    if (isSelected) {
      selectedCategoryId.add(id);
    } else {
      selectedCategoryId.remove(id);
    }
  }

  void resetFilters() {
    selectedCategoryId.clear();
    priceRange.value = SfRangeValues(minPrice.value, maxPrice.value);
    getFilteredProductsCount(page: 1);
  }
}
