import 'package:api_define/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());

  getData() async {
    debugPrint("==== home screen =====");
    homeController.getApi();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: homeController.getData.length,
              itemBuilder: (context, index) {
                return Text(
                  homeController.getData[index].name ?? "Unknown",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                );
              },
            );
          }),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                homeController.postApi();
              },
              child: Text("POST METHOD",style: TextStyle(fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}
