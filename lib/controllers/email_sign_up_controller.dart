
// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eman_shoping_center/controllers/device_token_controller.dart';
import 'package:eman_shoping_center/controllers/use_model.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class EmailSignUpController extends GetxController{


   


 static  var   isPasswordVisible = false.obs;

// ignore: non_constant_identifier_names, body_might_complete_normally_nullable
 static  Future<UserCredential?> SignUpMethod (
  String userEmail, 
  String userName,
  String uerPhone,
  String userCity,
  String userPassword,
  String userDeviceToken

) async{
   final GetDeviceTokenController getDeviceTokenController = Get.put(GetDeviceTokenController());
try {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   EasyLoading.show(status: "Please wait..");
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
   // send email verification
   await userCredential.user!.sendEmailVerification();
 
   UserModel userModel = UserModel(uId: userCredential.user!.uid, username: userName, email: userEmail, phone: userPassword, userImg: "", userDeviceToken: getDeviceTokenController.deviceToken.toString(), country: "", userAdress: "", street: "", isAdmin: false, isActive: true, createdOn: DateTime.now(), city: userCity);
// add data into firebase
 _firestore.collection("users").doc(userCredential.user!.uid).set(userModel.toMap());
 EasyLoading.dismiss();
 return userCredential;

} on FirebaseAuthException catch(e){
  EasyLoading.dismiss();
  Get.snackbar("Error", "$e",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: AppConstant.appSecondaryColor,
  colorText: AppConstant.appTextColor,
  );
}
}

}