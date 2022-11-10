import 'package:flutter_get_example/pages/get_controller/index_controller.dart';
import 'package:get/get.dart';

class GetIndexBinding extends Bindings {
  @override
  void dependencies() {
    print('GetIndexBinding dependencies');
    Get.lazyPut(() => IndexController());
  }
}
