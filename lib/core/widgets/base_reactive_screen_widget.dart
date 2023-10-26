import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/core/widgets/base_screen_widget.dart';
import 'package:flutter_base/screens/todos/list/todos_controller.dart';
import 'package:get/get.dart';

abstract class BaseReactiveScreenWidget<T extends BaseController> extends BaseScreenWidget {
  BaseReactiveScreenWidget({required super.widgetKey, required super.params,}): super();

  T get controller => Get.find(tag: params.toString());
  T createController();

  @override
  Widget buildView(BuildContext context) {
    Get.put(createController(), tag: params.toString());
    return const SizedBox.shrink();
  }

  @override
  void onResume() => controller.onResume();

  @override
  void onPause() => controller.onPause();
}