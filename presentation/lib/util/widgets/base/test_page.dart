// ignore_for_file: invalid_use_of_protected_member

import 'package:common/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/widgets/base/base_button_widget.dart';
import 'package:presentation/util/widgets/base/base_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    addIds();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: ['pendingIds'],
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BaseButtonWidget(
                buttonColor: Colors.black,
                textColor: Colors.white,
                onTap: () {
                  removeIds();
                },
                title: 'title',
              ),
            ),
          ],
        );
      },
    );
  }

  void addIds() {
    mainAppController.addPendingIds(['pendingIds']);
    consoleLog('pendingId from test ${mainAppController.pendingIds.value[0]}');
  }

  void removeIds() {
    mainAppController.removePendingIds(['pendingIds']);
  }
}
