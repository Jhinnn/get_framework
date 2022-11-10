import 'package:flutter_get_example/pages/share_controller_data_page/second_page.dart';
import 'package:get/get.dart';

class GetJumpOneLogic extends GetxController {
  var count = 0;

  ///跳转到跨页面
  void toJumpTwo() {
    Get.to(GetJumpTwoPage(), arguments: {'msg': '我是上个页面传递过来的数据'});
  }

  ///跳转到跨页面
  void increase() {
    count = ++count;
    update();
  }
}

