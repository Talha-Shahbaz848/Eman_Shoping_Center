import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class ForgotPasswordController extends GetxController{
final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> ForgotPasswordMethod(
  String userEamail
) async {
  try{
  EasyLoading.show(status: "Please wait..");
       await _auth.sendPasswordResetEmail(email: userEamail);
       Get.snackbar("Request recieved successfully!", "Password reset link is sent to $userEamail",
  snackPosition: SnackPosition.BOTTOM,
  colorText: AppConstant.appTextColor,
  backgroundColor: AppConstant.appSecondaryColor
  );
       EasyLoading.dismiss();
 } on FirebaseAuthException catch(e){
   EasyLoading.dismiss();
  Get.snackbar("Error!", "$e",
  snackPosition: SnackPosition.BOTTOM,
  colorText: AppConstant.appTextColor,
  backgroundColor: AppConstant.appSecondaryColor
  );
 }
}
}