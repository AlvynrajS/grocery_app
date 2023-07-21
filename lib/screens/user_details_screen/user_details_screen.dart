import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen.dart';
import 'package:grocery_application/screens/user_details_screen/user_details_controller.dart';
import 'package:grocery_application/utils/string_resource.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String routeName = '/userDetailScreen';

  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  UserDetailsController controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringResources.userDetails),
        automaticallyImplyLeading:
            Get.previousRoute == GroceryScreen.routeName ? true : false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: controller.nameController,
                  decoration:
                      const InputDecoration(labelText: StringResources.name),
                  validator: (value) {
                    controller.validate(value);
                  }),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(labelText: StringResources.email),
                validator: (value) {
                  controller.validate(value);
                },
              ),
              TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration:
                    const InputDecoration(labelText: StringResources.phone),
                validator: (value) {
                  controller.validate(value);
                },
              ),
              TextFormField(
                controller: controller.addressController,
                decoration:
                    const InputDecoration(labelText: StringResources.address),
                validator: (value) {
                  controller.validate(value);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.screenNavigation(context);
                },
                child: Text(controller.nameController.text.isNotEmpty
                    ? StringResources.go
                    : StringResources.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
