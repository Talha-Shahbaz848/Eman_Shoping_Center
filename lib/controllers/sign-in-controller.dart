 
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../utils/app_constant.dart';

class SignInController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var isVisisblePassowrd = false.obs;
  Future<UserCredential?> SignInMethod(
    String userEmail,
    String userPassword
  ) async {
   try{
  EasyLoading.show(status: "Please wait..");
     UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
   
   EasyLoading.dismiss();
   return userCredential;

   } on FirebaseAuthException catch(e) {
     EasyLoading.dismiss();
  Get.snackbar("Error", "$e",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: AppConstant.appSecondaryColor,
  colorText: AppConstant.appTextColor,
  );
   }
  }
  

}