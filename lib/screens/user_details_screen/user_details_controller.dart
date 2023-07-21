import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen.dart';
import 'package:grocery_application/utils/singleton.dart';

class UserDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.text = Singleton.getString("name");
    emailController.text = Singleton.getString("email");
    phoneController.text = Singleton.getString("phone");
    addressController.text = Singleton.getString("address");
  }

  void saveUserDetails() async {
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String address = addressController.text;
    Singleton.setString('name', name);
    Singleton.setString('email', email);
    Singleton.setString('phone', phone);
    Singleton.setString('address', address);
  }

  screenNavigation(context) {
    saveUserDetails();
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(GroceryScreen.routeName);
    }
  }

  String validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return "";
  }
}
