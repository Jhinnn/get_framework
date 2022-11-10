import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_jump_one_logic.dart';

class GetJumpOnePage extends StatelessWidget {
  /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final logic = Get.put(GetJumpOneLogic());

   GetJumpOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('跨页面-One')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.toJumpTwo(),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Center(
        child: GetBuilder<GetJumpOneLogic>(
          builder: (logic) {
            return Text('跨页面-Two点击了 ${logic.count} 次',
                style: const TextStyle(fontSize: 30.0));
          },
        ),
      ),
    );
  }
}

