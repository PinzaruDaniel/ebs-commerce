import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../resources/app_colors.dart';
import 'circular_progress_indicator_widget.dart';

class SmartRefresherWidget extends StatefulWidget {
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;
  final RefreshController controller;
  const SmartRefresherWidget({super.key, required this.onRefresh, required this.onLoading, required this.child, required this.controller});

  @override
  State<SmartRefresherWidget> createState() => _SmartRefresherWidgetState();
}


class _SmartRefresherWidgetState extends State<SmartRefresherWidget> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      footer: ClassicFooter(
        loadingText: AppTexts.loadingMore,
        loadingIcon: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 20, minWidth: 20)),
        canLoadingText: AppTexts.canLoading,
        idleText: AppTexts.idleText,
        noDataText: AppTexts.noDataText,
      ),
      header: WaterDropMaterialHeader(distance: 50, color: AppColors.primary, backgroundColor: Colors.grey.shade100),
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      child: widget.child,
    );
  }
}
