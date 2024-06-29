import 'package:eman_shoping_center/screens/auth_ui/welcome_screen.dart';
import 'package:eman_shoping_center/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async{
                GoogleSignIn googleSignIn = GoogleSignIn();
               FirebaseAuth firebaseAuth = FirebaseAuth.instance;
               await firebaseAuth.signOut();
               await googleSignIn.signOut();
                Get.offAll(()=> welcomeScreen());
              },
              child: const Icon(Icons.logout)),
            
          ),
        ],
      ),
      body: Lottie.asset('assets/images/appicon.json'),
    );
  }
}