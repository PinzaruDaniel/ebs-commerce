import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class AnimatedListItemWrapper extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final int index;
  final bool isRemoval;
  final String? keyValue;

  const AnimatedListItemWrapper({
    super.key,
    required this.child,
    required this.animation,
    required this.index,
    this.isRemoval = false,
    this.keyValue,
  });

  @override
  Widget build(BuildContext context) {
    final Widget animatedChild;

    if (isRemoval) {
      animatedChild = FadeTransition(
        opacity: animation,
        child: child
            .animate()
            .fadeOut(duration: 300.ms, curve: Curves.easeInOut)
            .slideY(begin: 0, end: 0.2, duration: 300.ms)
            .scaleXY(begin: 1, end: 0.85, duration: 300.ms),
      );
    } else {
      animatedChild = SizeFadeTransition(
        animation: animation,
        child: child
            .animate()
            .fadeIn(duration: 300.ms, delay: (100 + 200 * index).ms)
            .slideY(begin: 1, end: 0, duration: 400.ms, delay: (150 * index).ms, curve: Curves.easeInOut)
            .scaleXY(begin: 0.95, end: 1, duration: 400.ms, delay: (200 * index).ms),
      );
    }

    return KeyedSubtree(
      key: ValueKey(keyValue ?? 'animated_item_$index'),
      child: animatedChild,
    );
  }
}