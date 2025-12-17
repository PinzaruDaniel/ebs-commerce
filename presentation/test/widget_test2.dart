/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TapControlledSliverAppBar(),
    );
  }
}

class TapControlledSliverAppBar extends StatefulWidget {
  const TapControlledSliverAppBar({super.key});

  @override
  State<TapControlledSliverAppBar> createState() =>
      _TapControlledSliverAppBarState();
}

class _TapControlledSliverAppBarState extends State<TapControlledSliverAppBar> {
  final ScrollController _scrollController = ScrollController();

  static const double expandedHeight = 260;
  static const double collapsedHeight = kToolbarHeight;

  bool expanded = false;

  void toggle() {
    final targetOffset = expanded ? 0.0 : expandedHeight - collapsedHeight;

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );

    expanded = !expanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: expandedHeight,
            flexibleSpace: GestureDetector(
              onTap: toggle,
              behavior: HitTestBehavior.opaque,
              child: FlexibleSpaceBar(
                title: const Text('Tap to Expand / Collapse'),
                background: Container(
                  color: Colors.deepPurple,
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, i) => ListTile(title: Text('Item $i')),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
*//*


import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
   bool pressed=false;
  double _width = 70;
  double _height = 70;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GeeksForGeeks'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: pressed? Center(child: Text('wtf')): Center(child: Text('works')),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              // random generator
              final random = Random();

              // random dimension generator
              _width = random.nextInt(500).toDouble();
              _height = random.nextInt(500).toDouble();

              // random color generator
              _color = Color.fromRGBO(
                random.nextInt(300),
                random.nextInt(300),
                random.nextInt(300),
                1,
              );
              pressed=!pressed;

              // random radius generator
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
*/
