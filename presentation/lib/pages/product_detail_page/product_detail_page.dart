import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/product_detail_add_to_cart_pop_up_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_collapsed_app_bar_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/app_colors.dart';
import '../shopping_cart_page/shopping_cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ScrollController scrollController;
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final collapsed = scrollController.hasClients && scrollController.offset > (300 - 140);
    if (collapsed != isCollapsed) {
      setState(() => isCollapsed = collapsed);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 60,
            pinned: true,
            centerTitle: false,
            title: AnimatedOpacity(
              curve: Curves.easeOut,
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: isCollapsed ? ProductDetailCollapsedAppBarWidget(item: widget.item) : const SizedBox.shrink(),
            ),
            backgroundColor: isCollapsed ? Colors.white : Colors.transparent,
            surfaceTintColor: Colors.white,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage()));
                },
                icon: SvgPicture.asset('assets/icons/Cart icon.svg'),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(background: ProductDetailExpandedAppBar(item: widget.item)),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Material(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                elevation: 0,
                child: ProductDetailPageBodyWidget(item: widget.item),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        item: widget.item,
        title: 'title',
        router: () {
          AppRouter.openShoppingCartPage();
        },
        showIcon: true,
      ),
    );
  }
}
