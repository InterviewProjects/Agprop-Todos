import 'package:domain_package/usecase_extension.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with UseCaseExtension {
  final Map<String, dynamic> params;
  BaseController({required this.params}) : super();

  void onResume() {}

  void onPause() {}
}