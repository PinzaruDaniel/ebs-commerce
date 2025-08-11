import 'package:presentation/view/product_view_model.dart';
import '../pages/products_display_page/products_display_controller.dart';

abstract class BaseViewModel{}

class AdBannerViewModel extends BaseViewModel{}

class HorizontalProductListViewModel extends BaseViewModel{
  final List<ProductViewModel> products;
  final ProductListType type;
  HorizontalProductListViewModel({required this.products, required this.type});
}

class AllProductsViewItem extends BaseViewModel {
  final List<ProductViewModel> products;

  AllProductsViewItem({required this.products});
}