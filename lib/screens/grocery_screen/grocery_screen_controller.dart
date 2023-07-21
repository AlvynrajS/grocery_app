import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_application/models/grocery_list_model.dart';
import 'package:grocery_application/screens/grocery_stores_screen/grocery_store_screen.dart';
import 'package:grocery_application/screens/user_details_screen/user_details_screen.dart';

enum Screens { userDetailScreen, groceryDetailScreen, groceryStoreScreen }

class GroceryScreenController extends GetxController with StateMixin {
  TextEditingController searchTextController = TextEditingController();
  RxBool searchBoolean = false.obs;
  RxList<String> groceryList = [
    "Milk",
    "Eggs",
    "Bread",
    "Rice",
    "Pasta",
    "Cereal",
    "apples",
    "bananas",
    "oranges",
    "lettuce",
    "tomatoes",
    "carrots",
    "Chicken",
    "Beef",
    "Fish",
    "Yogurt",
    "Cheese",
    "Butter",
    "Cooking oil",
    "Sugar",
    "Salt",
    "black pepper",
    "cumin",
    "paprika",
    "beans",
    "tomatoes",
    "tuna",
    "Frozen vegetables",
    "Frozen pizza",
    "chips",
    "cookies",
    "popcorn",
    "water",
    "soda",
    "juice",
    "Coffee",
    "tea",
    "dish soap",
    "laundry detergent",
    "surface cleaner",
    "shampoo",
    "soap",
    "toothpaste",
    "Paper towels",
    "Toilet paper",
    "Garbage bags",
    "Aluminum foil",
    "plastic wrap"
  ].obs;
  RxList<String> infoSampleList = [
    "Carbohydrates: Provide energy and support brain function.",
    "Proteins: Build and repair tissues, support growth and development.",
    "Fats: Provide energy, store vitamins, and support cell function.",
    "Vitamins: Essential for various metabolic processes and overall health. Examples include vitamin A, vitamin C, vitamin D, etc.",
    "Minerals: Required for various bodily functions, such as bone health, nerve transmission, and muscle contraction. Examples include calcium, iron, potassium, etc.",
    "Fiber: Aids digestion, promotes healthy bowel movements, and supports heart health.",
    "Water: Essential for hydration, nutrient transport, and overall bodily functions.",
    "Antioxidants: Help protect cells from damage caused by free radicals and oxidative stress. Examples include vitamin E, vitamin C, and selenium.",
    "Omega-3 fatty acids: Essential fats that support brain health, heart health, and reduce inflammation. Found in fatty fish, flaxseeds, and walnuts.",
  ].obs;
  late RxList<int> counter =
      RxList<int>.generate(groceryList.length, (index) => 0);
  late RxList<int> price = RxList<int>.generate(
      groceryList.length, (index) => Random().nextInt(90) + 10);
  late RxList<String> info = RxList.generate(groceryList.length,
      (index) => infoSampleList[index % infoSampleList.length]);
  List<GroceryListModel> modelList = [];
  List<GroceryListModel> searchList = [];
  RxInt total = 0.obs;
  List<GroceryListModel> groceryDetailList = [];
  RxList<int> selectedIndexList = <int>[].obs;

  void onInit() {
    for (var i = 0; i < groceryList.length; i++) {
      GroceryListModel model =
          GroceryListModel(groceryList[i], counter[i], price[i], info[i]);
      modelList.add(model);
    }
    searchList = modelList;

  }

  searchIconOnTap() {
    searchBoolean.value = !searchBoolean.value;
    if (!searchBoolean.value) {
      searchList.clear();
      searchTextController.clear();
    }
  }

  screenNavigation(Screens screenName) {
    if (screenName == Screens.userDetailScreen) {
      Get.toNamed(UserDetailsScreen.routeName);
    } else if (screenName == Screens.groceryStoreScreen) {
      Get.toNamed(GroceryStoreScreen.routeName);
    } else {}
  }

  onChanged(String value) {
    searchList = modelList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    change(searchList);
  }

  counterCalculate(int values, bool isIncrementCount) {
    if (!isIncrementCount) {
      if (values > 0) {
        values--;
        change(values);
      }
    } else if (isIncrementCount) {
      values++;
      change(values);
    }
  }

  detailsListAdd() {
    for (var i = 0; i < modelList.length; i++) {
      for (var j = 0; j < selectedIndexList.length; j++) {
        if (i == selectedIndexList[j]) {
          groceryDetailList.add(modelList[i]);
        }
      }
    }
  }
}
