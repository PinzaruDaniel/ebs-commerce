import 'package:get/get.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController {
  final RxList<ProductViewModel> products = RxList<ProductViewModel>();
  final RxList<ProductViewModel> filteredProducts = RxList([]);

  final RxSet<int> selectedCategoryId = <int>{}.obs;

  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 0.0.obs;
  final Rx<SfRangeValues> priceRange = SfRangeValues(0.0, 0.0).obs;
  @override
  void onInit(){
    super.onInit();
    ever<SfRangeValues>(priceRange, (_)=>applyFilters());
    ever<Set<int>>(selectedCategoryId, (_)=>applyFilters());
  }

  void setProducts(List<ProductViewModel> items) {
    products.assignAll(items);
    final prices = products.map(_priceToDouble).whereType<double>().toList()..sort();
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

    filteredProducts.assignAll(products);
  }

  void onRangeChanged(SfRangeValues v) => priceRange.value = v;

  void onRangeChangeEnd(SfRangeValues v) => priceRange.value = v;

  bool isSelected(int id) => selectedCategoryId.contains(id);

  void toggleCategory(int id, bool selected) {
    if (selected) {
      selectedCategoryId.add(id);
    } else {
      selectedCategoryId.remove(id);
    }
  }

  void clearCategories() => selectedCategoryId.clear();

  void applyFilters(){
    final min=(priceRange.value.start as num).toDouble();
    final max=(priceRange.value.end as num).toDouble();
    final selected=selectedCategoryId;

    final result=products.where((p){
      final price=_priceToDouble(p);
      final matchesPrice=price!=null &&price>=min && price <=max;
      final categories=p.category;
      final matchesCategory=selected.isEmpty || categories.any((c)=>selected.contains(c.id));
      return matchesPrice && matchesCategory;

    }).toList();
    filteredProducts.assignAll(result);
  }

  void resetFilters() {
    selectedCategoryId.clear();
    priceRange.value = SfRangeValues(minPrice.value, maxPrice.value);
    applyFilters();
  }

  double? _priceToDouble(ProductViewModel p) {
    final dynamic price=p.price;
    if(price==null)return null;
    if(price is String){
      return double.tryParse(price);
    }
    return null;
  }
}
