import 'package:api_define/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/custom_shimmer.dart';

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
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.getDataProgress.value
                    ? 10
                    : homeController.getData.length,
                itemBuilder: (context, index) {
                  return homeController.getDataProgress.value
                      ?CustomShimmer(): Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      homeController.getData[index].name ?? "Unknown",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                homeController.postApi();
              },
              child: Text("POST METHOD", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}



///============== PICK IMAGE ===============
// Obx(() {
// // final image = completeYourProfileController.selectedImage.value;
// return Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(
// color: const Color(0XFFCFC9DD),
// borderRadius: BorderRadius.circular(10),
// ),
// child: authController.profileImagePath.value.isEmpty
// ? Image.asset(AssetsPath().profilePNG)
//     : ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: InkWell(
// onTap: () async {
// String profileImagePath =
// await generalController.selectSingleImage();
// authController.profileImagePath.value =
// profileImagePath;
// },
// child: Image.file(
// File(authController.profileImagePath.value),
// fit: BoxFit.fill),
// ),
// ),
// );
// }),