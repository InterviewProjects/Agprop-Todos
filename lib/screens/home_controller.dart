import 'package:domain_package/enums/feed_type.dart';
import 'package:domain_package/mapper/feed_object_mapper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<GetState> getState = GetState(1).obs;

  void onButtonPress() {
    int y = (getState.value.x) + 1;
    getState.value = GetState(y);

  }
}

class GetState {
  int x;
  GetState(this.x);
}