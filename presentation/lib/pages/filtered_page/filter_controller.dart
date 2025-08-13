import 'package:domain/modules/products/use_cases/get_all_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/category_picker_page/category_controller.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController {
  CategoryController get catController => Get.find();
  final GetFilteredProductsUseCase getFilteredProductsUseCase = GetIt.instance<GetFilteredProductsUseCase>();

  final RxList<ProductViewModel> filteredProducts = RxList([]);
  RxBool isLoading = true.obs;

  final RxDouble minPrice = 1.0.obs;
  final RxDouble maxPrice = 50000.0.obs;
  final Rx<SfRangeValues> priceRange = SfRangeValues(1.0, 50000.0).obs;
  final RxInt filteredCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    debounce<SfRangeValues>(priceRange, (_) => getFilteredProducts(page: 1), time: Duration(seconds: 1));
    debounce<Set<int>>(
      catController.selectedCategoryId,
      (_) => getFilteredProducts(page: 1),
      time: Duration(seconds: 1),
    );
  }

  Future<void> getFilteredProducts({required int page}) async {
    isLoading.value = true;

    final min = priceRange.value.start.toDouble();
    final max = priceRange.value.end.toDouble();
    final categories = catController.selectedCategoryId.toList();

    final result = await getFilteredProductsUseCase.call(
      GetFilteredProductsParams(
          page: page,
          priceGte: min, priceLte: max, categoriesId: categories.isNotEmpty ? categories : null),
    );

    result.fold(
      (failure) {
        filteredProducts.clear();
        filteredCount.value = 0;
      },
      (responseEntity) {
        final products = responseEntity.response.map((e) => e.toModel).toList();
        filteredProducts.value = products;
        filteredCount.value = responseEntity.count;
      },
    );

    isLoading.value = false;
  }
  void onRangeChanged(SfRangeValues v) => priceRange.value = v;

  void onRangeChangeEnd(SfRangeValues v) => priceRange.value = v;

  void resetFilters() {
    catController.selectedCategoryId.clear();
    priceRange.value = SfRangeValues(minPrice.value, maxPrice.value);
    getFilteredProducts(page: 1);
  }
}
