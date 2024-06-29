import 'package:eman_shoping_center/firebase_options.dart';
 
import 'package:eman_shoping_center/screens/user_panel/splash_screen.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
debugShowCheckedModeBanner: false,

      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      
      ),
      home: const splashScreen(),
       builder: EasyLoading.init(),
          );
  }
}

 