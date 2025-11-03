import 'package:api_define/UI/widget/toast.dart';
import 'package:api_define/practice/controller/p_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PHome extends StatefulWidget {
  const PHome({super.key});

  @override
  State<PHome> createState() => _PHomeState();
}

class _PHomeState extends State<PHome> {
  final PHomeController pHomeController = Get.put(PHomeController());

  Future getDataAtHome()async{
   await  pHomeController.callGetAPI();
  }
  @override
  void initState() {
    getDataAtHome();
    Future.delayed(Duration(seconds: 1)).then((_) {
      Toast.successToast('Home Screen');
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder:(context, index) {
        return Text("Home Screen",style: TextStyle(fontSize: 25),);
      }, ),
    );
  }
}
