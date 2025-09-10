import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerAnimation extends StatelessWidget {
  final Widget Function(BuildContext, VoidCallback openContainer) closedBuilder;
  final Widget Function(BuildContext, VoidCallback) openBuilder;
  final ShapeBorder? closedShape;

  const OpenContainerAnimation({super.key, required this.closedBuilder, required this.openBuilder, this.closedShape});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 400),
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor:Colors.transparent,
      closedShape: closedShape??RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))) ,
      openBuilder: (context, closeContainer) => openBuilder(context, closeContainer),
      closedBuilder: (context, openContainer) => closedBuilder(context, openContainer),
    );
  }
}
