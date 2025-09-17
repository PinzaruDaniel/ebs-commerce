import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:presentation/pages/delivery_address_page/widgets/delivery_type_widget.dart';
import 'package:presentation/pages/delivery_address_page/widgets/selection_widget.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';
import 'package:presentation/view/base_view_model.dart';

class AnimatedListItemsBuildWidget extends StatelessWidget {
  final BaseViewModel item;
  final Animation<double> animation;
  final int index;
  final bool isRemoval;
  final Function? onCallBack;

  const AnimatedListItemsBuildWidget({
    super.key,
    required this.item,
    required this.animation,
    required this.index,
    this.isRemoval = false,
    this.onCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final String keyValue;

    if (item is DeliveryTypeViewModel) {
      final viewModel = item as DeliveryTypeViewModel;
      child = DeliveryTypeWidget(itemViewModel: viewModel, onCallBack: onCallBack??(){});
      keyValue = 'delivery_type';
    } else if (item is SelectionViewModel) {
      final viewModel = item as SelectionViewModel;
      child = SelectionWidget(
        itemViewModel: viewModel,
        onSelectionChanged: (value) {
          onCallBack?.call();
        },
      );
      keyValue = '${viewModel.keyId}_${viewModel.title}';
    } else if (item is TextFieldViewModel) {
      final viewModel = item as TextFieldViewModel;
      child = TextFieldWidget(itemViewModel: viewModel);
      keyValue = viewModel.keyId!;
    } else {
      child = const SizedBox.shrink();
      keyValue = 'unknown_$index';
    }

    if (item is DeliveryTypeViewModel) return child;

    if (isRemoval) {
      return FadeTransition(
        opacity: animation,
        child: child
            .animate()
            .fadeOut(duration: 100.ms, curve: Curves.easeInOut)
            .slideY(begin: 0, end: 0.2, duration: 100.ms)
            .scaleXY(begin: 1, end: 0.8, duration: 100.ms),
      );
    }

    return SizeFadeTransition(
      animation: animation,
      child: KeyedSubtree(
        key: ValueKey(keyValue),
        child: child
            .animate()
            .fadeIn(duration: 400.ms, delay: (200 + index * 100).ms)
            .slideY(begin: 1, end: 0, duration: 400.ms, delay: (150 * index).ms, curve: Curves.easeInOut)
            .scaleXY(begin: 0.95, end: 1, duration: 400.ms, delay: (200 * index).ms),
      ),
    );
  }
}

