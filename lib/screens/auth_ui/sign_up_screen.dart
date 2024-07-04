// ignore_for_file: camel_case_types

import 'package:eman_shoping_center/controllers/email_sign_up_controller.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import 'sign_inscreen.dart';

class signUpScreen extends StatefulWidget {
       const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
final EmailSignUpController emailSignUpController =
      Get.put(EmailSignUpController());
       
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          title: const Text(
            "Sign UP",
            style: TextStyle(color: AppConstant.appTextColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to Eman Shoping Center",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  child: TextFormField(
                    controller: username,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "UserName",
                        prefixIcon: const Icon(Icons.person)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userPhone,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Phone",
                        prefixIcon: const Icon(Icons.phone)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userCity,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "City",
                        prefixIcon: const Icon(Icons.location_city)),
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
                        obscureText:
                            EmailSignUpController.isPasswordVisible.value,
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
                                EmailSignUpController.isPasswordVisible
                                    .toggle();
                              },
                              child:
                                  EmailSignUpController.isPasswordVisible.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                        ),
                      ),
                    )),
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
                        String name = username.text.trim();
                        String phone = userPhone.text.trim();
                        String city = userCity.text.trim();
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();
                        String userDeviceToken = 'kkk';
                        if (name.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty) {
                          Get.snackbar(
                            "Error! ",
                            "Please enter all details",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          UserCredential? userCredential =
                              await EmailSignUpController.SignUpMethod(email,
                                  name, phone, city, password, userDeviceToken);

                          if (userCredential != null) {
                            Get.snackbar(
                              "Verification email sent. ",
                              "Please check your gmail inbox",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                            await  FirebaseAuth.instance.signOut();
                            Get.offAll(()=> const signInScreen());
                          }
                        }
                      },
                      child: const Text(
                        "Sign Up",
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
                      "Already have an Account? ",
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
                                builder: (context) => const signInScreen(),
                              ));
                        },
                        child: const Text(
                          "Sign In",
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
        ),
      );
    });
  }
}
