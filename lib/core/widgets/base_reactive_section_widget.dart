import 'package:flutter/material.dart';
import 'package:flutter_base/core/controllers/base_controller.dart';
import 'package:flutter_base/core/widgets/base_section_widget.dart';
import 'package:get/get.dart';

abstract class BaseReactiveSectionWidget<T extends BaseController> extends BaseSectionWidget {
  const BaseReactiveSectionWidget({required super.widgetKey, required super.params}): super();

  T get controller => Get.find(tag: params.toString());
  T createController();

  @override
  Widget buildView(BuildContext context) {
    Get.put(createController(), tag: params.toString());
    return const SizedBox.shrink();
  }
}