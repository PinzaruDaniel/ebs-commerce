import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/app_bar_widget.dart';
import '../../util/widgets/bottom_navigation_bar_widget.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
        child: Form(
          key: _formKey,
          child: Obx(
                () => ImplicitlyAnimatedList<BaseViewModel>(
              padding: const EdgeInsets.only(bottom: 10),
              items: deliveryAddressController.allItems.toList(),
              insertDuration: const Duration(milliseconds: 800),
              removeDuration: const Duration(milliseconds: 800),
              updateDuration: const Duration(milliseconds: 800),
              areItemsTheSame: (a, b) {
                if (a.runtimeType != b.runtimeType) return false;
                if (a is DeliveryTypeViewModel && b is DeliveryTypeViewModel) {
                  print('${a.selected.value} siiasta ${b.selected.value}');
                  return a.selected.value == b.selected.value;
                }
                if (a is SelectionViewModel && b is SelectionViewModel) {
                  print('${a.title} nimica ${b.title}');

                  return a.title == b.title;
                }
                if (a is TextFieldViewModel && b is TextFieldViewModel) {
                  return a.title == b.title;
                }
                return false;
              },
              itemBuilder: (context, animation, item, index) {
                Widget widget;
                String keyValue =
                    '${deliveryAddressController.deliveryTypeVM.value.selected.value}_${item.runtimeType}_${item.hashCode}_$index';
                if (item is DeliveryTypeViewModel) {
                  widget = DeliveryTypeWidget(itemViewModel: item);
                  keyValue = 'delivery_type_${item.selected.value}_$index';
                } else if (item is SelectionViewModel) {
                  widget = SelectionWidget(itemViewModel: item);
                  keyValue =
                  'selection_${item.title}_${deliveryAddressController.deliveryTypeVM.value.selected.value}_${item.hashCode}_$index';
                } else if (item is TextFieldViewModel) {
                  widget = TextFieldWidget(itemViewModel: item);
                  keyValue =
                  'text_field_${item.title}_${deliveryAddressController.deliveryTypeVM.value.selected.value}_${item.hashCode}_$index';
                } else {
                  widget = const SizedBox.shrink();
                }
                return KeyedSubtree(
                  key: ValueKey(keyValue),
                  child: item is DeliveryTypeViewModel
                      ? widget
                      : SizeTransition(
                    sizeFactor: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 1.0), // Slide from bottom-right
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: widget,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        title: deliveryAddressController.isLoading.value ? AppTexts.loading : AppTexts.save,
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