import 'package:domain/modules/products/use_cases/get_all_products_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/category_picker_page/category_controller.dart';
import 'package:presentation/util/mapper/product_mapper.dart';
import 'package:presentation/view/category_view_model.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController {
  CategoryController get catController=>Get.find();
  final GetAllProductsUseCase getAllProductsUseCase = GetIt.instance<GetAllProductsUseCase>();

  RxList<ProductViewModel> products = RxList<ProductViewModel>();
  final RxList<ProductViewModel> filteredProducts = RxList([]);
  RxBool isLoading = true.obs;
  final RxSet<int> selectedCategoryId = <int>{}.obs;

  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 1.0.obs;
  final Rx<SfRangeValues> priceRange = SfRangeValues(0.0, 1.0).obs;

  @override
  void onInit() {
    super.onInit();
    ever<SfRangeValues>(priceRange, (_) => applyFilters());
    ever<Set<int>>(selectedCategoryId, (_) => applyFilters());
  }

  Future<void> getAllProducts() async {
    if (products.isNotEmpty) {
      isLoading.value = false;
      return resetFilters();
    }

    isLoading.value = true;

    await getAllProductsUseCase.call().then((either) async {
      either.fold(
        (failure) {
          isLoading.value = false;
        },

        (list) async {
          products.assignAll(list.map((e) => e.toModel).toList());
          setProducts(products);
          isLoading.value = false;
        },
      );
    });
  }

  void setProducts(List<ProductViewModel> items) {
    for (final p in items) {}

    final valid = items.where((p) => _priceToDouble(p) != null && p.stock != null).toList();
    final prices = valid.map(_priceToDouble).whereType<double>().toList()..sort();
    if (prices.isEmpty) {
      minPrice.value = 0;
      maxPrice.value = 1;
      priceRange.value = SfRangeValues(0, 1);
      filteredProducts.assignAll(products);
      return;
    }

    minPrice.value = prices.first;
    maxPrice.value = prices.last;
    priceRange.value = SfRangeValues(minPrice.value, maxPrice.value);

    products.assignAll(valid);
    filteredProducts.assignAll(valid);
  }

  void onRangeChanged(SfRangeValues v) => priceRange.value = v;

  void onRangeChangeEnd(SfRangeValues v) => priceRange.value = v;

  // bool isSelected(int id) => selectedCategoryId.contains(id);

  bool? getCategorySelectionState(int categoryId) {
    final children = catController.groupedCategories[categoryId];
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

    if (catController.groupedCategories.containsKey(id)) {
      for (var child in catController.groupedCategories[id]!) {
        toggleCategoryRecursive(child.id, selected);
      }
    }
  }



  void toggleCategory(int id, bool? selected) {
    if (selected==true) {
      selectedCategoryId.add(id);
    } else if(selected==false) {
      selectedCategoryId.remove(id);
    }
    else{
      return;
    }
  }

  void clearCategories() => selectedCategoryId.clear();

  void applyFilters() {
    final min = (priceRange.value.start as num).toDouble();
    final max = (priceRange.value.end as num).toDouble();
    final selected = selectedCategoryId;

    final result = products.where((p) {
      final price = _priceToDouble(p);
      final matchesPrice = price != null && price >= min && price <= max;
      final categories = p.category;
      final matchesCategory = selected.isEmpty || categories.any((c) => selected.contains(c.id));
      return matchesPrice && matchesCategory;
    }).toList();
    filteredProducts.assignAll(result);
  }

  void resetFilters() {
    selectedCategoryId.clear();
    priceRange.value = SfRangeValues(minPrice.value, maxPrice.value);
    setProducts(products);
  }

  double? _priceToDouble(ProductViewModel p) {
    final dynamic price = p.price;
    if (price == null) return null;

    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) return double.tryParse(price);
    return null;
  }
}
