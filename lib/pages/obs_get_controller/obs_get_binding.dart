import 'package:flutter_get_example/pages/get_controller/index_controller.dart';
import 'package:flutter_get_example/pages/obs_get_controller/obs_index_controller.dart';
import 'package:get/get.dart';

class ObsGetIndexBinding extends Bindings {
  @override
  void dependencies() {
    print('ObsGetIndexBinding dependencies');
    Get.lazyPut(() => ObsIndexController());
  }
}
