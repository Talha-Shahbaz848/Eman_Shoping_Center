
import 'package:eman_shoping_center/screens/auth_ui/sign_inscreen.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controller.dart';
// ignore: camel_case_types
class welcomeScreen extends StatelessWidget {
   welcomeScreen({super.key});
final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
   var  size = MediaQuery.of(context).size;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: AppConstant.appSecondaryColor,
      title: const Text("Welcome to Eman Shoping Center", style: TextStyle(color: AppConstant.appTextColor),),
      centerTitle: true,
      elevation: 0,
    ),     
    body: Column(

      children: [
        Container(
          width: double.infinity,
          color: AppConstant.appSecondaryColor,
          child: Lottie.asset("assets/images/appicon.json", width: 250, height: 250),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child:  Text("Happy Shoping Day", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
        ),
        const SizedBox(
          height: 25+0,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: size.width *.7,
          height: size.height *.08,
          child: Material(
            
            borderRadius: BorderRadius.circular(15),
            color: AppConstant.appSecondaryColor,
            child: TextButton.icon(onPressed: (){
              _googleSignInController.signInWithGoogle();
            }, icon: Image.asset("assets/images/google.png", width: 40, height: 40,), label: const Text("Sign in With Google", style: TextStyle(color: AppConstant.appTextColor, fontSize: 15),)),
          ),
        ),
         const SizedBox(
          height: 50,
                    ),
        SizedBox(
          width: size.width *.7,
          height: size.height *.08,
          child: Material(
            
            borderRadius: BorderRadius.circular(15),
            color: AppConstant.appSecondaryColor,
            child: TextButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const signInScreen(),));
            }, icon: const Icon(Icons.email, color: AppConstant.appTextColor, size: 35,), label: const Text("Sign in With Email", style: TextStyle(color: AppConstant.appTextColor, fontSize: 15),)),
          ),
        ),
      ],
    )
    );
  }
}