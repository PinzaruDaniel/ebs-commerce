import 'package:get/get.dart';
import 'package:presentation/view/category_view_model.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterController extends GetxController {
  final RxList<ProductViewModel> products = RxList<ProductViewModel>();
  final RxList<ProductViewModel> filteredProducts = RxList([]);

  final RxSet<int> selectedCategoryId = RxSet<int>();

  final RxDouble minPrice = RxDouble(0.0);
  final RxDouble maxPrice = RxDouble(0.0);
  final Rx<SfRangeValues> priceRange = Rx(SfRangeValues(0.0, 0.0));

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

  void _applyFilters(){
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

  double? _priceToDouble(ProductViewModel p) {
    final dynamic price=p.price;
    if(price==null)return null;
    if(price is num) return price.toDouble();
    if(price is String){
      print('iaca pret $price');
      final cleaned=price.replaceAll(RegExp(r'[^0-9\.\,]'), '').replaceAll(',', '.');
      return double.tryParse(cleaned);
    }
    return null;
  }
}
