import 'package:examapi/screen/homescreen/controller/home_controller.dart';
import 'package:examapi/screen/homescreen/model/home_model.dart';
import 'package:examapi/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                (controller.list[index].tags[1]
                            .source!.coverPhoto.urls.small ==
                        null)
                    ?
                Image.network(
                        "${controller.list[0].user.profileImage.small}")
                    :
                Image.network(
                        "${controller.list[index].tags[1]
                            .source!.coverPhoto.urls.small}"),
                itemCount: controller.list.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: controller.GetAPicall(),
        ),
      ),
    );
  }
}
