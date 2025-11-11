import 'package:common/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/profile_page/profie_controller.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import '../../controllers/controller_imports.dart';
import '../../util/widgets/product_image_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController get profileController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
    profileController.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    consoleLog('user number ${currentUserController.userVM.value?.number}');
    return Scaffold(
      appBar: AppBarWidget(showBorder: true, title: 'My Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 0.3, color: Colors.black26)],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              currentUserController.userVM.value?.imageUrl ??
                                  'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: '${AppTexts.name}: ', style: AppTextsStyle.bold(size: 18)),
                                      TextSpan(
                                        text:
                                            '${currentUserController.userVM.value?.name ?? ''} ${currentUserController.userVM.value?.surname ?? ''}',
                                        style: AppTextsStyle.medium.copyWith(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: '${AppTexts.email}: ', style: AppTextsStyle.bold()),
                                      TextSpan(
                                        text: currentUserController.userVM.value?.email ?? '',
                                        style: AppTextsStyle.medium.copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                if (currentUserController.userVM.value?.number != null &&
                                    currentUserController.userVM.value?.number != '')
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: '${AppTexts.phone}: ', style: AppTextsStyle.bold()),
                                        TextSpan(
                                          text: currentUserController.userVM.value?.number ?? '',
                                          style: AppTextsStyle.medium.copyWith(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: HeaderTitleWidget(
                  itemViewModel: HeaderTitleViewModel(title: 'ORDER HISTORY', showDivider: false, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 0.3, color: Colors.black26)],
                  ),
                  child: ListView.builder(
                    itemCount: profileController.orders.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, orderIndex) {
                      final order = profileController.orders[orderIndex];
                      final isLastOrder = orderIndex == profileController.orders.value.length - 1;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Order placed on ${order.dateTime.toString().split('.')[0]}',
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
        ),
      ),
    );
  }
}
