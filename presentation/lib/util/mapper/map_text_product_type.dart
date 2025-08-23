import '../../pages/shopping_cart_page/enum/product_type.dart';

extension MapTextProductType on ProductListType {
  String? get title {
    switch (this) {
      case ProductListType.newProducts:
        return 'NEW PRODUCTS';
      case ProductListType.saleProducts:
        return 'SALE PRODUCTS';
      case ProductListType.allProducts:
        return 'ALL PRODUCTS';
      default:
        return null;
    }
  }
}