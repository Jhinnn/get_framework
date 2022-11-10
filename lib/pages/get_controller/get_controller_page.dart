import 'package:flutter/material.dart';
import 'package:flutter_get_example/pages/get_controller/index_controller.dart';
import 'package:get/get.dart';

class GetControllerPage extends StatefulWidget {
  const GetControllerPage({Key? key}) : super(key: key);

  @override
  State<GetControllerPage> createState() => _GetControllerPageState();
}

class _GetControllerPageState extends State<GetControllerPage> {
  @override
  Widget build(BuildContext context) {
    // IndexController indexController = Get.put(IndexController(),tag: '1');
    print('GetControllerPage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetController'),
      ),
      body: Center(
        child: Column(
          children: [
            /*
            GetBuilder是配合update使用
            需要使用update手动调用刷新
            GetBuilder内部实际上是对StatefulWidget的封装，所以占用资源极小
            */

            //用法一：
            GetBuilder<IndexController>(
                filter: (value) => value.counter,
                builder: (logic) {
                  print('IndexController counter build');

                  return Text(
                    logic.counter.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                }),

            //用法二：
            GetBuilder<IndexController>(
                // init: IndexController(),
                filter: (value) => value.name,
                builder: (logic) {
                  print('IndexController name build');
                  return GetTextWidget(text: logic.name);
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<IndexController>().increment();
          Get.find<IndexController>().changeName();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print('GetControllerPage  didChangeDependencies');
  }
}

class GetTextWidget extends StatefulWidget {
  final String text;
  const GetTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<GetTextWidget> createState() => _GetTextWidgetState();
}

class _GetTextWidgetState extends State<GetTextWidget> {
  @override
  Widget build(BuildContext context) {
    print('GetTextWidget build');
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.headline3,
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print('GetTextWidget didChangeDependencies');
  }
}
