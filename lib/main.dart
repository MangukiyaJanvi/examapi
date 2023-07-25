import 'package:examapi/screen/homescreen/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: '/', page: () => HomeScreen())],
    ),
  );
}
