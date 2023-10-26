import 'package:flutter/material.dart';
import 'package:flutter_base/screens/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(() {
          return Text('${controller.getState.value.x}');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onButtonPress,
        child: const Icon(Icons.add),
      ),
    );
  }
}
