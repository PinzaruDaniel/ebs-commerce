import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/product_view_model.dart';

class ProductResponseViewModel extends BaseViewModel {
  final int count;
  final int? totalPages;
  final int? perPage;
  final List<ProductViewModel> response;

  ProductResponseViewModel({
    required this.count,
    required this.totalPages,
    required this.perPage,
    required this.response,
  });
}
