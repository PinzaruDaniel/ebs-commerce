import 'package:flutter/material.dart';

class AppBarIconSearchWidget extends StatefulWidget {
  final bool isTapped;
  final Function() onTap;

  const AppBarIconSearchWidget({super.key, required this.isTapped, required this.onTap});

  @override
  State<AppBarIconSearchWidget> createState() => _AppBarIconSearchWidgetState();
}


class _AppBarIconSearchWidgetState extends State<AppBarIconSearchWidget> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 1),
        child: widget.isTapped ? Container(height: 20, width: 30, color: Colors.blue) : Icon(Icons.search),
      ),
    );
  }
}
