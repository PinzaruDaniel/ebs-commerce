import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
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
              areItemsTheSame: (a, b) {
                if (a.runtimeType != b.runtimeType) return false;
                if (a is SelectionViewModel && b is SelectionViewModel) {
                  return a.keyId == b.keyId;
                } else if (a is TextFieldViewModel && b is TextFieldViewModel) {
                  return a.keyId == b.keyId;
                } else if (a is DeliveryTypeViewModel && b is DeliveryTypeViewModel) {
                  return true;
                }
                return false;
              },
              removeItemBuilder: (context, animation, oldItem) {
                Widget widget;
                String keyValue;

                if (oldItem is DeliveryTypeViewModel) {
                  widget = DeliveryTypeWidget(itemViewModel: oldItem);
                  keyValue = 'delivery_type';
                } else if (oldItem is SelectionViewModel) {
                  widget = SelectionWidget(itemViewModel: oldItem);
                  keyValue = 'selection_${oldItem.keyId}';
                } else if (oldItem is TextFieldViewModel) {
                  widget = TextFieldWidget(itemViewModel: oldItem);
                  keyValue = 'text_field_${oldItem.keyId}';
                } else {
                  widget = const SizedBox.shrink();
                  keyValue = 'unknown_remove';
                }

                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final fadeValue = animation.value;
                    final scaleValue = 0.7 + 0.3 * fadeValue;

                    return Opacity(
                      opacity: fadeValue,
                      child: Transform.scale(scale: scaleValue, child: child),
                    );
                  },
                  child: KeyedSubtree(key: ValueKey(keyValue), child: widget),
                );
              },
              itemBuilder: (context, animation, item, index) {
                Widget widget;
                String keyValue;

                if (item is DeliveryTypeViewModel) {
                  widget = DeliveryTypeWidget(itemViewModel: item);
                  keyValue = 'delivery_type';
                } else if (item is SelectionViewModel) {
                  widget = SelectionWidget(itemViewModel: item);
                  keyValue = 'selection_${item.keyId}';
                } else if (item is TextFieldViewModel) {
                  widget = TextFieldWidget(itemViewModel: item);
                  keyValue = 'text_field_${item.keyId}';
                } else {
                  widget = const SizedBox.shrink();
                  keyValue = 'unknown_$index';
                }

                return SizeFadeTransition(
                  animation: animation,
                  child: KeyedSubtree(
                    key: ValueKey(keyValue),
                    child: item is DeliveryTypeViewModel
                        ? widget
                        : widget
                              .animate()
                              .fadeIn(duration: 500.ms, delay: (50 * index).ms)
                              .slideY(
                                begin: 0.8,
                                end: 0.0,
                                duration: 500.ms,
                                delay: (100 * index).ms,
                                curve: Curves.easeInOut,
                              )
                              .scaleXY(
                                begin: 0.7,
                                end: 1,
                                duration: 500.ms,
                                delay: (75 * index).ms,
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
}
