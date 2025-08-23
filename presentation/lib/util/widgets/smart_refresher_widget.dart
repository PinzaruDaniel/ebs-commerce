import 'package:flutter/material.dart';
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

final RefreshController _refreshController = RefreshController(initialRefresh: false);

class _SmartRefresherWidgetState extends State<SmartRefresherWidget> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      footer: ClassicFooter(
        loadingText: 'Loading more...',
        loadingIcon: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 20, minWidth: 20)),
        canLoadingText: 'Release to load more',
        idleText: 'Pull up to load more',
        noDataText: 'No more data',
      ),
      header: WaterDropMaterialHeader(distance: 50, color: AppColors.primary, backgroundColor: Colors.grey.shade100),
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      child: widget.child,
    );
  }
}
