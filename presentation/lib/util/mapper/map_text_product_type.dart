
import '../enum/product_type.dart';
import '../resources/app_texts.dart';

extension MapTextProductType on ProductListType {
  String? get title {
    switch (this) {
      case ProductListType.newProducts:
        return AppTexts.newProducts;
      case ProductListType.saleProducts:
        return AppTexts.saleProducts;
      case ProductListType.allProducts:
        return AppTexts.allProducts;
      default:
        return null;
    }
  }
}