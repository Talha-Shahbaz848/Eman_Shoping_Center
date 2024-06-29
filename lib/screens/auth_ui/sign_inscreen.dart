// ignore_for_file: camel_case_types, unnecessary_null_comparison

import 'package:eman_shoping_center/controllers/sign-in-controller.dart';
import 'package:eman_shoping_center/screens/admin_panel/admin_panal_main_screen.dart';
import 'package:eman_shoping_center/screens/auth_ui/forget_password_screen.dart';
import 'package:eman_shoping_center/screens/auth_ui/sign_up_screen.dart';
import 'package:eman_shoping_center/screens/user_panel/mainscreen.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/get_user_data_controller.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          title: const Text(
            "Sign In",
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,
                      obscureText: signInController.isVisisblePassowrd.value,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: InkWell(
                            onTap: () {
                              signInController.isVisisblePassowrd.toggle();
                            },
                            child: signInController.isVisisblePassowrd.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                    ),
                  )),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, right: 13),
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(
                    "Forgot Passward?",
                    style: TextStyle(
                        color: AppConstant.appSecondaryColor,
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold),
                  ),
                )),
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
                      String password = userPassword.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential =
                            await signInController.SignInMethod(
                                email, password);
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);

                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if (userData[0]['isAdmin'] == true) {
                               Get.snackbar(
                                "Login Succsess!",
                                "Welcome to Admin Panal",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,

                              );

                              Get.offAll(() => const AdminMainScreen());
                             
                            } else {
                               Get.offAll(() => const MainScreen());
                               Get.snackbar(
                                "Success!",
                                "login successfully done",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,
                              );
                             
                            }
                          } else {
                            Get.snackbar(
                              "Error!",
                              "Please verify your email before login",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 17),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    "Don't have an Account? ",
                    style: TextStyle(
                      color: AppConstant.appSecondaryColor,
                      fontSize: 17,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const signUpScreen(),
                            ));
                      },
                      child: const Text(
                        "Sign Up?",
                        style: TextStyle(
                            color: AppConstant.appSecondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
