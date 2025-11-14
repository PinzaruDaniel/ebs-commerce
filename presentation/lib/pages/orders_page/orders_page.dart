import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/orders_page/orders_controller.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/loading_overlay_widget.dart';

import '../../util/widgets/product_image_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  OrdersController get ordersController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(OrdersController());
    ordersController.initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBorder: true, title: AppTexts.myOrders),
      body: SafeArea(
        child: Obx(() {
          if (ordersController.isLoading.value) {
            return const Center(child: LoadingOverlayWidget());
          }

          if (ordersController.orders.isEmpty) {
            return Center(child: Text(AppTexts.nothingToShow, style: AppTextsStyle.bold()));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 0.3, color: Colors.black38)],
                    ),
                    child: ListView.builder(
                      itemCount: ordersController.orders.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, orderIndex) {
                        final order = ordersController.orders[orderIndex];
                        final isLastOrder = orderIndex == ordersController.orders.length - 1;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  '${AppTexts.orderPlacedOn} ${order.dateTime.toString().split('.')[0]}',
                                  style: AppTextsStyle.bold(size: 16),
                                ),
                              ),
                              ...order.products.map(
                                (item) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: ProductImageWidget(
                                          height: 80,
                                          width: 80,
                                          imageUrl: item.imageUrl != null && item.imageUrl!.isNotEmpty
                                              ? item.imageUrl
                                              : null,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.title,
                                                softWrap: true,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text('\$${item.price}'),
                                              const SizedBox(height: 4),
                                              Text('${AppTexts.quantity.capitalizeFirst}: ${item.quantity}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (!isLastOrder)
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                                  child: Divider(thickness: 1.2, color: Colors.grey),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
