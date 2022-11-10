import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObsIndexController extends GetxController {
  // var unEditingController = TextEditingController();
  var pwEditingController = TextEditingController().obs;
  var unEditingController = TextEditingController().obs;

  RxBool shouldClear = false.obs;
  RxBool detailPs = true.obs;
  RxBool canLogin = false.obs;

  RxInt _counter = 0.obs;
  RxInt get counter => _counter;

  RxString _name = 'Lili'.obs;
  RxString get name => _name;

  increment() {
    _counter++;
  }

  changeName() {
    _name = '$_name:boby:' as RxString;
  }

  clearUnText() {
    unEditingController.value.clear();
  }

  showPassWord() {
    detailPs.value = !detailPs.value;
  }

  login() {
    String userName = unEditingController.value.text;
    String password = pwEditingController.value.text;
    print('用户名 $userName 密码：$password');
  }

  @override
  void onReady() {
    // TODO: implement onReady

    unEditingController.value.addListener(() {
      shouldClear.value = unEditingController.value.text.isNotEmpty;
      if (pwEditingController.value.text.length >= 6 &&
          GetUtils.isEmail(unEditingController.value.text)) {
        canLogin.value = true;
      } else {
        canLogin.value = false;
      }
    });

    pwEditingController.value.addListener(() {
      if (pwEditingController.value.text.length >= 6 &&
          GetUtils.isEmail(unEditingController.value.text)) {
        canLogin.value = true;
      } else {
        canLogin.value = false;
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    unEditingController.value.dispose();
    pwEditingController.value.dispose();

    super.onClose();
  }
}
