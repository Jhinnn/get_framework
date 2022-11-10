import 'package:flutter/material.dart';
import 'package:flutter_get_example/main.dart';
import 'package:flutter_get_example/pages/get_controller/get_controller_page.dart';
import 'package:flutter_get_example/pages/share_controller_data_page/init_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'obs_get_controller/obs_get_controller_page.dart';

class GetDialogPage extends StatefulWidget {
  const GetDialogPage({Key? key}) : super(key: key);

  @override
  State<GetDialogPage> createState() => _GetDialogPageState();
}

class _GetDialogPageState extends State<GetDialogPage>
   {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // IndexController indexController = Get.put(IndexController());
    print('GetDialogPage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetTool'),
      ),
      body: Center(
        child: Column(
          children: [
            MyWidget(
                voidCallback: () {
                  Get.showSnackbar(GetSnackBar(
                    title: 'TITEL',
                    message: 'MESSAGE',
                    titleText: const Text('titleText'),
                    messageText: const Text('messageText'),
                    icon: const Icon(Icons.close),
                    shouldIconPulse: true,
                    leftBarIndicatorColor: Colors.red,
                    mainButton: TextButton(
                        onPressed: () {}, child: const Text('titleText')),
                    duration: const Duration(seconds: 5),
                    onTap: (GetSnackBar getSnackBar) {},
                    isDismissible: true,
                    dismissDirection: DismissDirection.down,
                    showProgressIndicator: true,
                    // progressIndicatorController:_animationController,
                    snackPosition: SnackPosition.BOTTOM,
                    progressIndicatorBackgroundColor: Colors.green,
                    // progressIndicatorValueColor: _doubleAnim,
                    snackStyle: SnackStyle.FLOATING,
                    snackbarStatus: (status) {
                      print(status);
                    },
                  ));
                },
                title: 'GET showSnackbar'),
            MyWidget(
                voidCallback: () {
                  Get.snackbar('title', 'message',
                      snackPosition: SnackPosition.TOP);
                },
                title: 'GET snackbar'),
            MyWidget(
                voidCallback: () {
                  Get.rawSnackbar(
                      title: 'title',
                      message: 'MESSAGE',
                      titleText: const Text('titleText'),
                      messageText: const Text('messageText'),
                      icon: const Icon(Icons.close),
                      snackPosition: SnackPosition.TOP);
                },
                title: 'GET rawSnackbar'),
            MyWidget(
                voidCallback: () {
                  Get.bottomSheet(
                    ListView(
                      children: [
                        MyWidget(voidCallback: () {}, title: 'GET MyWidget'),
                        MyWidget(voidCallback: () {}, title: 'GET MyWidget'),
                      ],
                    ),
                    backgroundColor: Colors.black,
                    persistent: false,
                    barrierColor: Colors.transparent,
                    isDismissible: true,
                  );
                },
                title: 'GET bottomSheet'),
            MyWidget(
                voidCallback: () {
                  Get.defaultDialog();
                },
                title: 'GET defaultDialog'),
            MyWidget(
                voidCallback: () {
                  // GetStorage box = GetStorage();
                  // var value = box.read('list');

                  Get.dialog(Material(
                      type: MaterialType.transparency,
                      child: Center(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return Text('data');
                            }),
                      )));
                },
                title: 'GET dialog'),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print('GetDialogPage  didChangeDependencies');
  }
}
