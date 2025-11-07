import 'package:flutter/material.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';

import '../../controllers/controller_imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showBorder: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black45)]),
                child: CircleAvatar(
                  maxRadius: 12,
                  minRadius: 6,
                  backgroundImage: NetworkImage(
                    currentUserController.userVM.value?.imageUrl ??
                        'https://cdn-icons-png.flaticon.com/512/6522/6522516.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
