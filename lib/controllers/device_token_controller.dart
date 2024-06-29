// ignore_for_file: avoid_print

import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController{
String? deviceToken;

@override
  void onInit() {
        super.onInit();
    getDeviceToken();
  }
  
  Future<void> getDeviceToken() async{
 try{
   String? token = await FirebaseMessaging.instance.getToken();
   if(token != null){
    deviceToken = token;
  print("token : $deviceToken ");
    update();
   }
 } catch(e){
  Get.snackbar("Error", "$e",
  snackPosition: SnackPosition.BOTTOM,
  colorText: AppConstant.appTextColor,
  backgroundColor: AppConstant.appSecondaryColor,
    );
 }

  }
  

}

