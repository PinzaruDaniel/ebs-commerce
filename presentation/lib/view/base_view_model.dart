import 'package:presentation/util/widgets/horizontal_products_list_widget.dart';
import 'package:presentation/view/product_list_type_enum.dart';
import 'package:presentation/view/product_view_model.dart';

abstract class BaseViewModel{}

class AdBannerViewModel extends BaseViewModel{}

class HorizontalProductListViewModel extends BaseViewModel{
  final List<ProductViewModel> products;
  final ProductListType type;
  HorizontalProductListViewModel({required this.products, required this.type});
}

class AllProductsViewItem extends BaseViewModel {
  final ProductListType type;

  AllProductsViewItem({required this.type});
}