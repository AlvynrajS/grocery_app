import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_application/screens/grocery_detail_screen/grocery_detail_screen.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen_controller.dart';
import 'package:grocery_application/screens/user_details_screen/user_details_screen.dart';

class GroceryStoreScreenController extends GetxController with StateMixin {
  RxList<String> storeList =
      ["Store A", "Store B", "Store C", "Store D", "Store E"].obs;
  late RxList<bool> selectedStore;
  RxBool isEnable = false.obs;
  RxList<int> selectedStoreIndexList = <int>[].obs;
  RxList<String> selectedStoreList = <String>[].obs;
  RxList<List> priceList = <List>[].obs;

  GroceryScreenController groceryController =
      Get.put(GroceryScreenController());

  onInit() {
    selectedStore = RxList.filled(storeList.length, false);
    for (var i = 0; i < storeList.length; i++) {
      priceList.add(RxList<int>.generate(groceryController.groceryList.length,
          (index) => Random().nextInt(90) + 10));
    }
    change(priceList);
  }

  checkBoxSelected(bool value, int index) {
    selectedStore[index] = value;
    change(selectedStore);
    isEnable = selectedStore.any((element) => element == true).obs;
  }

  getStoresSelectedList() {
    selectedStore.asMap().forEach((key, value) {
      if (value == true) {
        selectedStoreIndexList.add(key);
      }
    });
    selectedStoreIndexList = selectedStoreIndexList.toSet().toList().obs;
    change(selectedStoreIndexList);
    for (var i = 0; i < storeList.length; i++) {
      for (var j = 0; j < selectedStoreIndexList.length; j++) {
        if (i == selectedStoreIndexList[j]) {
          selectedStoreList.add(storeList[i]);
        }
      }
    }
    selectedStoreList = selectedStoreList.toSet().toList().obs;
    change(selectedStoreList);
  }

  screenNavigation() {
    Get.toNamed(GroceryDetailScreen.routeName);
  }
}
