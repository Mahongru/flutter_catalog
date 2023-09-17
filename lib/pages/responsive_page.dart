import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: currentWidth < 600 ? Colors.purple : Colors.green,
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Text(currentWidth.toString()),
          Text(currentHeight.toString()),
        ],
      ))),
    );
  }
}
