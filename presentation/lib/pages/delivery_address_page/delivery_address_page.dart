import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_item_build_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';
import '../../view/base_view_model.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(
        title: AppTexts.deliveryAddress.capitalizeFirst,
        showBorder: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final items = deliveryAddressController.allItems.toList();

          return Form(
            key: _formKey,
            child: ImplicitlyAnimatedList<BaseViewModel>(
              items: items,
              padding: const EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              areItemsTheSame: (a, b) => false,
              removeItemBuilder: (context, animation, oldItem) {
                Widget widget = buildWidgetForItem(oldItem);
                return oldItem is DeliveryTypeViewModel
                    ? widget
                    : FadeTransition(
                  opacity: animation,
                  child: widget.animate().fadeOut(duration: 200.ms),
                );
              },
              itemBuilder: (context, animation, item, index) {
                final built = buildItemWidget(item, index);
                Future.delayed(Duration(seconds: 1));
                return SizeFadeTransition(
                  animation: animation,
                  child: KeyedSubtree(
                    key: ValueKey(built.key),
                    child: item is DeliveryTypeViewModel
                        ? built.widget
                        : built.widget
                        .animate()
                        .fadeIn(duration: 700.ms, delay: (150 * index).ms)
                        .slideY(
                      begin: 0.8,
                      end: 0.0,
                      duration: 600.ms,
                      delay: (100 * index).ms,
                      curve: Curves.easeInOut,
                    )
                        .scaleXY(
                      begin: 0.7,
                      end: 1,
                      duration: 800.ms,
                      delay: (100 * index).ms,
                      curve: Curves.easeInOut,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        title: AppTexts.save,
        showIcon: false,
        onTap: () {
          if (_formKey.currentState?.validate() ?? false) {
            checkoutController.initAllItems();
            deliveryAddressController.onInit();
            Navigator.pop(context);
          }
        },
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.noProductsToShow,
      ),
    );
  }
  Widget buildWidgetForItem(BaseViewModel item) {
    if (item is DeliveryTypeViewModel) {
      return DeliveryTypeWidget(itemViewModel: item);
    } else if (item is SelectionViewModel) {
      return SelectionWidget(itemViewModel: item);
    } else if (item is TextFieldViewModel) {
      return TextFieldWidget(itemViewModel: item);
    }
    return SizedBox.shrink();
  }
}
