import 'package:get/get.dart';

class IndexController extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  String _name = 'Lili';
  String get name => _name;

  increment() {
    _counter++;
    update();
  }

  changeName() {
    _name = '$_name:boby';
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    ///dosomething
    super.onInit();

    // print('IndexController onInit');
  }

  @override
  void onReady() {
    // TODO: implement onReady

    ///dosomething
    super.onReady();

    // print('IndexController onReady');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    // print('IndexController onClose');
  }
}
