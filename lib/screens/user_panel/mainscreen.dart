// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:eman_shoping_center/widgets/banner_widget.dart';
import 'package:eman_shoping_center/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName, style: TextStyle(color: AppConstant.appTextColor),),
        centerTitle: true,
         
      iconTheme: IconThemeData(
        color: AppConstant.appTextColor
      )
      ),
      
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
               height: Get.height / 90.0,
              ),
              Text("Eman shoping Center"),
              BannerWidget(),
            ],
          ),
        ),
      )
    );
  }
}
