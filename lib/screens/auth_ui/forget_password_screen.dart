// ignore_for_file: camel_case_types

import 'package:eman_shoping_center/controllers/forget_password_scren_controer.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  TextEditingController userEmail = TextEditingController();
    @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          title: const Text(
            "Forget Password",
            style: TextStyle(color: AppConstant.appTextColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppConstant.appSecondaryColor,
              child: Column(
                children: [
                  isKeyboardVisible
                      ? const Text(
                          "Please Fill The Following to Sign in",
                          style: TextStyle(
                              fontSize: 16, color: AppConstant.appTextColor),
                        )
                      : Lottie.asset("assets/images/appicon.json",
                          height: 300, width: 300),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userEmail,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Gmail",
                      prefixIcon: const Icon(Icons.email)),
                ),
              ),
            ),
              const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: AppConstant.appSecondaryColor,
                child: TextButton(
                    onPressed: () async {
                      String email = userEmail.text.trim();
                    
                      if (email.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,
                        );
                        
                      }
                      else{ 
                         forgotPasswordController.ForgotPasswordMethod(email);
                      }
                    },
                    child: const Text(
                      "Forget",
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 17),
                    )),
              ),
            ),
             
          ],
        ),
      );
    });
  }
}
