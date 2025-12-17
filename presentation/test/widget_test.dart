import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/text_field_widget.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: CustomHeightAppBarDemo()));
}

class CustomHeightAppBarDemo extends StatefulWidget {
  const CustomHeightAppBarDemo({super.key});

  @override
  State<CustomHeightAppBarDemo> createState() => _CustomHeightAppBarDemoState();
}

class _CustomHeightAppBarDemoState extends State<CustomHeightAppBarDemo> {
  bool isExpanded = false;
  final ScrollController _scrollController = ScrollController();

  static const double collapsedHeight = 60;
  static const double expandedHeight = 120;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: collapsedHeight, end: isExpanded ? expandedHeight : collapsedHeight),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, height, _) {
          final progress = ((height - collapsedHeight) / 60).clamp(0.0, 1.0);

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: !isExpanded,
                floating: !isExpanded,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                expandedHeight: height,
                collapsedHeight: height,
                shape: Border(bottom: BorderSide(color: Colors.black12)),
                title: const Text('Products'),
                actions: [
                  Opacity(
                    opacity: 1 - progress,
                    child: Transform.scale(
                      scale: 1 - (0.1 * progress),
                      child: IconButton(icon: const Icon(Icons.search), onPressed: isExpanded ? null : toggle),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Opacity(
                        opacity: progress,
                        child: Transform.scale(
                          scale: 0.9 + (0.1 * progress),
                          child: height > collapsedHeight
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),

                                    child: TextFieldWidget(
                                      itemViewModel: TextFieldViewModel(
                                        hintText: 'Search..',
                                        isRequiredValidation: false,
                                        //textController: textController,
                                      ),
                                      suffixIcon: IconButton(icon: const Icon(Icons.close), onPressed: toggle),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((_, i) => ListTile(title: Text('Item $i')), childCount: 30),
              ),
            ],
          );
        },
      ),
    );
  }
}
