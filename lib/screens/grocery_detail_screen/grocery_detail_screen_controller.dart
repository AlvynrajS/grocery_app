import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen_controller.dart';
import 'package:grocery_application/screens/grocery_stores_screen/grocery_store_controller.dart';

class GroceryDetailScreenController extends GetxController with StateMixin {
  GroceryScreenController groceryController =
      Get.put(GroceryScreenController());
  GroceryStoreScreenController storeController =
      Get.put(GroceryStoreScreenController());

  List priceLists = [];
  List totalValues = [];
  RxList<bool> storesCheckbox = <bool>[].obs;
  RxBool isEnable = false.obs;

  @override
  void onInit() {
    super.onInit();
    groceryController.groceryDetailList =
        groceryController.groceryDetailList.toSet().toList();
    storeController.selectedStoreList;
    storesCheckbox =
        RxList.filled(storeController.selectedStoreList.length, false);
  }

  listTileSelect(bool value, int index) {
    for (int i = 0; i < storesCheckbox.length; i++) {
      storesCheckbox[i] = i == index;
    }
    isEnable = storesCheckbox.any((element) => element == true).obs;
  }
}
