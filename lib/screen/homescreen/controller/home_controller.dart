import 'package:examapi/utils/api_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  // RxList<Homemodel> list = <Homemodel>[].obs;
  List<Homemodel> list = [];

  Future<List<Homemodel>> GetAPicall() async {
    list = await ApiHelper.apihelper.getApi();
    print(list);
    return list;
  }
}
