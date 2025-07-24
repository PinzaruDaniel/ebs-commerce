import 'package:presentation/util/widgets/horizontal_products_list_widget.dart';
import 'package:presentation/view/product_view_model.dart';

abstract class BaseViewModel{}

class AdBannerViewModel extends BaseViewModel{}
class HorizontalProductListViewModel extends BaseViewModel{
  final List<ProductViewModel> products;
  final ProductType type;
  HorizontalProductListViewModel({required this.products, required this.type});
}