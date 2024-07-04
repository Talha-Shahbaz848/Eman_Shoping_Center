// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerControler extends GetxController{

RxList<String> bannerUrl = RxList<String>([]);

@override
  void onInit() {
    super.onInit();
    getBannerImage();
  }
  
  Future<void> getBannerImage() async{
try{
  QuerySnapshot bannerSnapshot = await FirebaseFirestore.instance.collection("images").get();
  if(bannerSnapshot.docs.isNotEmpty){
    bannerUrl.value = bannerSnapshot.docs.map((doc) => doc['image'] as String ).toList();
  }
}
catch (e) {
  print("error $e");
}

  }

}