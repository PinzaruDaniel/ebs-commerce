
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/home_page.dart';

import 'controllers/bindings/root_bindings_controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await RootBinding().dependencies();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce ebs app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(dragHandleColor: Colors.grey.shade300),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito-sans',
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => HomePage())],
    );
  }
}
