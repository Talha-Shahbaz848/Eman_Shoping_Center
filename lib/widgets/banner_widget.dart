// ignore_for_file: avoid_unnecessary_containers


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eman_shoping_center/controllers/banner_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final BannerControler bannerControler = Get.put(BannerControler());
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(items: bannerControler.bannerUrl.map((image) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover, width: Get.width -10.0, placeholder: (context, url) => const ColoredBox(color: Colors.white,
        child:  Center(
          child: CupertinoActivityIndicator(),
        ),), errorWidget: (context, url, error) => const Icon(Icons.error),),
      ),).toList(), options: CarouselOptions(
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      aspectRatio: 2.5,
      viewportFraction: 1
      ),),
    );
  }
}