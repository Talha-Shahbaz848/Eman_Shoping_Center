// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/auth_ui/welcome_screen.dart';
import '../utils/app_constant.dart';
class DrawerWidget extends StatefulWidget {
   const  DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height/ 25),
    
    child: Drawer(
        backgroundColor: AppConstant.appSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: Wrap(
          runSpacing: 10,
          children:  [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Eman's Shop", style: TextStyle(color: AppConstant.appTextColor),),
                subtitle: Text("Version 1.0.1", style: TextStyle(color: AppConstant.appTextColor),),
                leading: CircleAvatar(
                  backgroundColor: AppConstant.appMainColor,
                  radius: 22.0,
                  child: Text("E", style: TextStyle(color: AppConstant.appTextColor),),
                ),
              ),
            ),
            Divider(
              endIndent: 10.0,
              indent: 10.0,
              color: Colors.grey,
              thickness: 1.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Home", style: TextStyle(color: AppConstant.appTextColor),),
                leading: Icon(Icons.home, color: AppConstant.appTextColor,),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.appTextColor,),
               
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              leading: Icon(Icons.production_quantity_limits, color: AppConstant.appTextColor,),
              title: Text("Products", style: TextStyle(color: AppConstant.appTextColor),),
              trailing: Icon(Icons.arrow_forward, color: AppConstant.appTextColor,),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag_rounded, color: AppConstant.appTextColor,),
              title: Text("order", style: TextStyle(color: AppConstant.appTextColor),),
              trailing: Icon(Icons.arrow_forward, color: AppConstant.appTextColor,),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            
            ),

Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              leading: Icon(Icons.help, color: AppConstant.appTextColor,),
              title: Text("contact", style: TextStyle(color: AppConstant.appTextColor),),
              trailing: Icon(Icons.arrow_forward, color: AppConstant.appTextColor,),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            
            ),
Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                  await firebaseAuth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => welcomeScreen());
                },
              leading: Icon(Icons.logout, color: AppConstant.appTextColor,),
              title: Text("Logout", style: TextStyle(color: AppConstant.appTextColor),),
              trailing: Icon(Icons.arrow_forward, color: AppConstant.appTextColor,),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            
            ),
          ],
        ),
      ),
           
    );
  }
}