import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_get_example/main.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

class GetStoragePage extends StatefulWidget {
  const GetStoragePage({Key? key}) : super(key: key);

  @override
  State<GetStoragePage> createState() => _GetStoragePageState();
}

class _GetStoragePageState extends State<GetStoragePage>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  // Animation<Color>? _doubleAnim;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // IndexController indexController = Get.put(IndexController());
    print('GetStoragePage build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage'),
      ),
      body: Center(
        child: Column(
          children: [
            MyWidget(
                voidCallback: () async {
                  GetStorage getStorage = GetStorage('login');
                  getStorage.write('autoLogin', false);
                },
                title: 'GetStorage'),
            MyWidget(
                voidCallback: () async {
                  print(randomBetween(10,
                      20)); // some integer between 10 and 20 where 0 <= min <= max <= 999999999999999
                  print(randomNumeric(
                      4)); // sequence of 4 random numbers i.e. 3259
                  print(randomString(
                      10)); // random sequence of 10 characters i.e. e~f93(4l-
                  print(randomAlpha(
                      5)); // random sequence of 5 alpha characters i.e. aRztC
                  print(randomAlphaNumeric(
                      10)); // random sequence of 10 alpha numeric i.e. aRztC1y32
                  GetStorage getStorage = GetStorage('login');
                  getStorage.write(
                      randomAlphaNumeric(10), randomAlphaNumeric(10));
                },
                title: 'GetStorage random string'),
            MyWidget(
                voidCallback: () async {
                  MyPref myPref = MyPref();
                  print(myPref.age.val);
                  print(myPref.price.val);
                },
                title: 'GetStorage MyPref'),
            MyWidget(
                voidCallback: () async {
                  updateAge();
                },
                title: 'GetStorage updateAge')
          ],
        ),
      ),
    );
  }

  void updateAge() {
    final age = 0.val('age');
    // or
    // final age = ReadWriteValue('age', 0, () => box);
    // or
    // final age = Get.find<MyPref>().age;

    age.val = 1; // will save to box
    final realAge = age.val; // will read from box
    print(realAge);
  }
}

class MyPref {
  static final _otherBox = () => GetStorage('MyPref');

  final username = ''.val('username');
  final age = 0.val('age');
  final price = 1000.val('price', getBox: _otherBox);

  // or
  // final username2 = ReadWriteValue('username', '');
  // final age2 = ReadWriteValue('age', 0);
  // final price2 = ReadWriteValue('price', '', _otherBox);
}
