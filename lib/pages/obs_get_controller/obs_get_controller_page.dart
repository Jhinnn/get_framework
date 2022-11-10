import 'package:flutter/material.dart';
import 'package:flutter_get_example/pages/obs_get_controller/obs_index_controller.dart';
import 'package:get/get.dart';

class ObsGetControllerPage extends StatefulWidget {
  const ObsGetControllerPage({Key? key}) : super(key: key);

  @override
  State<ObsGetControllerPage> createState() => _ObsGetControllerPageState();
}

class _ObsGetControllerPageState extends State<ObsGetControllerPage> {
  @override
  Widget build(BuildContext context) {
    ObsIndexController obsIndexController = Get.find<ObsIndexController>();
    print('ObsGetControllerPage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetController OBS'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*
                Obx是配合Rx响应式变量使用
                响应式变量变化，Obx自动刷新
                每一个响应式变量，都需要生成对应的GetStream，占用资源大于基本数据类型，会对内存造成一定压力
              */
              Column(
                children: [
                  Obx(
                    () => TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: InputBorder.none,
                          filled: true,
                          suffixIcon: Visibility(
                              visible: obsIndexController.shouldClear.value,
                              child: InkWell(
                                onTap: () => obsIndexController.clearUnText(),
                                child: const Icon(Icons.close),
                              )),
                          isCollapsed: true,
                          hintText: '请输入邮箱',
                          fillColor: Colors.grey),
                      controller: obsIndexController.unEditingController.value,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            border: InputBorder.none,
                            filled: true,
                            hintText: '请输入密码，长度不能少于6',
                            suffixIcon: InkWell(
                              onTap: () => obsIndexController.showPassWord(),
                              child: obsIndexController.detailPs.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            isCollapsed: true,
                            fillColor: Colors.grey),
                        controller: obsIndexController.pwEditingController.value,
                        maxLines: 1,
                        obscureText: obsIndexController.detailPs.value,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      )),
                  const SizedBox(height: 10),
                  Obx(() => TextButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              obsIndexController.canLogin.value
                                  ? Colors.green
                                  : Colors.grey)),
                      onPressed: () => obsIndexController.canLogin.value
                          ? obsIndexController.login()
                          : null,
                      child: Text(
                        '登录',
                        style: Theme.of(context).textTheme.titleLarge,
                      ))),
                ],
              ),
              Column(
                children: [
                  Obx(() {
                    print('ObsGetControllerPage counter build');
                    return Text(
                      obsIndexController.counter.value.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }),
                  Obx(() {
                    print('ObsGetControllerPage name build');
                    return Text(
                      obsIndexController.name.value,
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => obsIndexController.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
