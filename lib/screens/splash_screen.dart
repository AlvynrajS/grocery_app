import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/screens/user_details_screen/user_details_screen.dart';
import 'package:grocery_application/utils/image_resource.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(UserDetailsScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Image.asset(ImageResource.logo)),
    );
  }
}
