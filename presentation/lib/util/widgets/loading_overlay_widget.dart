import 'package:flutter/material.dart';
import 'circular_progress_indicator_widget.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingOverlayWidget({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
        Positioned.fill(
          child: Center(
            child: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75)),
          ),
        ),
      ],
    );
  }
}
