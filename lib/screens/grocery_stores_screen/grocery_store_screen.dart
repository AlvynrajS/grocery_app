import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/screens/grocery_stores_screen/grocery_store_controller.dart';
import 'package:grocery_application/utils/string_resource.dart';

class GroceryStoreScreen extends StatefulWidget {
  static const String routeName = "/GroceryStoreScreen";

  const GroceryStoreScreen({super.key});

  @override
  State<GroceryStoreScreen> createState() => _GroceryStoreScreenState();
}

class _GroceryStoreScreenState extends State<GroceryStoreScreen> {
  GroceryStoreScreenController controller =
      Get.put(GroceryStoreScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroceryStoreScreenController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(StringResources.stores),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return Obx(() {
                  return CheckboxListTile(
                    tileColor: Colors.black12,
                    title: Text(controller.storeList[index]),
                    onChanged: (value) {
                      controller.checkBoxSelected(value!, index);
                    },
                    value: controller.selectedStore[index],
                  );
                });
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: controller.storeList.length),
          bottomNavigationBar: controller.isEnable.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.getStoresSelectedList();
                      controller.screenNavigation();
                    },
                    child: const Text(StringResources.groceryDetails),
                  ),
                )
              : null);
    });
  }
}
