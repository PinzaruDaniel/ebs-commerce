import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Text('Nothing to show right now', style: TextStyle(fontSize: 16, color: Colors.grey)),
      ),
    );
  }
}
