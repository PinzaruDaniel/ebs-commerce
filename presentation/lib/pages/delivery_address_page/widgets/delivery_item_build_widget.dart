import 'package:flutter/cupertino.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/animated_list_items_build_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class DeliveryItemBuildWidget extends StatelessWidget {
  final BaseViewModel item;
  final Animation<double> animation;
  final int index;
  final bool isRemoval;
  final Function onCallBack;
  final Function(String)? onSelectionChanged;


  const DeliveryItemBuildWidget({
    super.key,
    required this.item,
    required this.animation,
    required this.index,
    this.isRemoval = false,
    required this.onCallBack,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final String keyValue;

    if (item is DeliveryTypeViewModel) {
      final viewModel = item as DeliveryTypeViewModel;
      child = DeliveryTypeWidget(itemViewModel: viewModel, onCallBack: onCallBack);
      keyValue = 'delivery_type';
    } else if (item is SelectionViewModel) {
      final viewModel = item as SelectionViewModel;
      child = SelectionWidget(itemViewModel: viewModel, onSelectionChanged: onSelectionChanged);
      keyValue = 'selection_${viewModel.keyId}_${viewModel.title}';
    } else if (item is TextFieldViewModel) {
      final viewModel = item as TextFieldViewModel;
      child = TextFieldWidget(itemViewModel: viewModel);
      keyValue = 'text_field_${viewModel.keyId}';
    } else {
      child = const SizedBox.shrink();
      keyValue = 'unknown_$index';
    }

    if (animation.status == AnimationStatus.dismissed) {
      return KeyedSubtree(key: ValueKey(keyValue), child: child);
    }

    return AnimatedListItemWrapper(
      animation: animation,
      index: index,
      isRemoval: isRemoval,
      child: child,
    );
  }

}
