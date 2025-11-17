import 'package:presentation/view/base_view_model.dart';

import 'ordered_products_view_model.dart';

class OrderViewModel extends BaseViewModel{
  final int idOrder;
  final int idUser;
  final DateTime dateTime;
  final List<OrderedProductsViewModel> products;

  OrderViewModel({
    required this.idOrder,
    required this.idUser,
    required this.dateTime,
    required this.products,
  });
}
