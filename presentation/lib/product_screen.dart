import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/home_controller.dart';
import 'package:presentation/pages/home_page/home_page.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  HomeController get homeController=>Get.find();

  @override
  void initState(){
    super.initState();
    Get.put(HomeController());
homeController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'), actions: [
        IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }, icon: SvgPicture.asset('assets/icons/Cart icon.svg')),
      ],),
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.products.length,
          itemBuilder: (_, index) {
            final product = homeController.products[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.description?? ''),
              trailing: Text('\$${product.price}'),
            );
          },
        );
      }),
    );
  }
}