import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class DeliveryItemBuildWidget {
  final Widget widget;
  final String key;

  DeliveryItemBuildWidget({
    required this.widget,
    required this.key,
  });
}

class DeliveryItemBuilder {
  static DeliveryItemBuildWidget buildItemWidget(BaseViewModel item, [int? index]) {
    final Widget widget;
    final String keyValue;

    if (item is DeliveryTypeViewModel) {
      widget = DeliveryTypeWidget(itemViewModel: item);
      keyValue = 'delivery_type';
    } else if (item is SelectionViewModel) {
      widget = SelectionWidget(itemViewModel: item);
      keyValue = 'selection_${item.keyId}_${item.title}';
    } else if (item is TextFieldViewModel) {
      widget = TextFieldWidget(itemViewModel: item);
      keyValue = 'text_field_${item.keyId}';
    } else {
      widget = const SizedBox.shrink();
      keyValue = 'unknown_${index ?? 'x'}';
    }

    return DeliveryItemBuildWidget(widget: widget, key: keyValue);
  }

  static Widget buildAnimatedItem({
    required BaseViewModel item,
    required Animation<double> animation,
    required int index,
    bool isRemoval = false,
  }) {
    final built = buildItemWidget(item, index);

    if (item is DeliveryTypeViewModel) {
      return built.widget;
    }

    if (isRemoval) {
      return FadeTransition(
        opacity: animation,
        child: built.widget.animate().fadeOut(duration: 200.ms),
      );
    }

    return SizeFadeTransition(
      animation: animation,
      child: KeyedSubtree(
        key: ValueKey(built.key),
        child: built.widget
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
  }
}


