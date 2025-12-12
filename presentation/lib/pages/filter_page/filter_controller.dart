import 'dart:async';
import 'dart:ui';

import 'package:domain/modules/products/use_cases/get_filtered_products_count_use_case.dart';
import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/util/error_parser.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../util/routing/app_pop_up.dart';
import '../../view/category_view_model.dart';

class FilterController extends GetxController {
  final GetFilteredProductsCountUseCase getFilteredProductsCountUseCase =
      GetIt.instance<GetFilteredProductsCountUseCase>();
  final RxSet<int> selectedCategoryId = <int>{}.obs;
  final RxList<CategoryViewModel> categories = RxList([]);
  ErrorParser errorParser = ErrorParser();
  final RxList<ProductViewModel> filteredProducts = RxList([]);
  RxBool isLoading = true.obs;
  final RxDouble minPrice = 1.0.obs;
  final RxDouble maxPrice = 50000.0.obs;
  final Rx<SfRangeValues> priceRange = SfRangeValues(1.0, 50000.0).obs;
  final RxInt filteredCount = 0.obs;
  int i = 0;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  late Worker everWorkers;

  void initItems() {
    everWorkers = everAll([selectedCategoryId, priceRange], (_) {
      _debouncer.run(() {
        getFilteredProductsCount(page: 1);
      });
    });
    getFilteredProductsCount(page: 1);
  }

  void setCategoryData({required Set<int> selectedIds, required List<CategoryViewModel> allCategories}) {
    selectedCategoryId.value = selectedIds;
    categories.value = allCategories;
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

  Future<void> getFilteredProductsCount({required int page, GetFilteredProductsCountParams? params}) async {
    isLoading.value = true;
    i++;
    final min = priceRange.value.start.toDouble();
    final max = priceRange.value.end.toDouble();
    final categories = selectedCategoryId.toList();

    final result = await getFilteredProductsCountUseCase.call(
      params ??
          GetFilteredProductsCountParams(
            page: page,
            priceGte: min,
            priceLte: max,
            categoriesId: categories.isNotEmpty ? categories : null,
          ),
    );

    result.fold(
      (failure) {
        var errorMessage = errorParser.handleError(failure: failure);
        AppPopUp.showFailureSnackBar(fallbackMessage: errorMessage);

        filteredCount.value = 0;
        isLoading.value = false;
        isLoading.refresh();
      },
      (responseEntity) {
        filteredCount.value = responseEntity;
        isLoading.value = false;
        isLoading.refresh();
      },
    );
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
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
