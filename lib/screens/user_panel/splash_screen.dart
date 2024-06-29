
import "dart:async";

import "package:eman_shoping_center/controllers/get_user_data_controller.dart";
import "package:eman_shoping_center/screens/admin_panel/admin_panal_main_screen.dart";
import "package:eman_shoping_center/screens/auth_ui/welcome_screen.dart";
import "package:eman_shoping_center/screens/user_panel/mainscreen.dart";
import "package:eman_shoping_center/utils/app_constant.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";

 

// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
User? user = FirebaseAuth.instance.currentUser;  
 @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds: 5), (){
    keepUserLoggedIn(context);
    });
  }


    Future<void> keepUserLoggedIn(BuildContext context) async {
     

     if(user != null){
      final GetUserDataController getUserDataController = Get.put(GetUserDataController());
     var userData = await getUserDataController.getUserData(user!.uid);
        if(userData[0]['isAdmin'] == true){
          Get.offAll(()=> const AdminMainScreen());
        }
        else{
          Get.offAll(()=> const MainScreen());
        }
     }
     else{
      Get.to(()=> welcomeScreen());
     }

    } 
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
     

      backgroundColor: AppConstant.appSecondaryColor,
     body: Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Expanded(
         child: Container(
          alignment: Alignment.center,
          
          child: Lottie.asset("assets/images/appicon.json", height: 200, width: 200, )),
       ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Powered by KingGTech", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
        )
      ],
     ),
    );
  }
}