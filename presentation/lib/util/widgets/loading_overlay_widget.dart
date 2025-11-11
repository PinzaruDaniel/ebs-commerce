import 'package:flutter/material.dart';
import 'circular_progress_indicator_widget.dart';

class LoadingOverlayWidget extends StatelessWidget {

  const LoadingOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75)),
          ),
        ),
      ],
    );
  }
}
