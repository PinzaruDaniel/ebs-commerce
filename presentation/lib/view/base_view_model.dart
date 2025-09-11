import 'package:presentation/view/product_view_model.dart';

import '../util/enum/product_type.dart';

abstract class BaseViewModel {}

class AdBannerViewModel extends BaseViewModel {}

class HorizontalProductListViewModel extends BaseViewModel {
  final List<ProductViewModel> products;
  final ProductListType type;

  HorizontalProductListViewModel({required this.products, required this.type});
}

class AllProductsViewItem extends BaseViewModel {
  final List<ProductViewModel> products;
  final ProductListType type;

  AllProductsViewItem({required this.products, this.type = ProductListType.allProducts});
}
