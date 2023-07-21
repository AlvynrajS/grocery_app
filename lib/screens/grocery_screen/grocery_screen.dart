import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/models/grocery_list_model.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen_controller.dart';
import 'package:grocery_application/utils/singleton.dart';
import 'package:grocery_application/utils/string_resource.dart';

class GroceryScreen extends StatefulWidget {
  static const String routeName = "/GroceryScreen";

  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  GroceryScreenController controller = Get.put(GroceryScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroceryScreenController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: controller.searchBoolean.value == false
                    ? const Text(StringResources.groceries,
                        style: TextStyle(color: Colors.white))
                    : TextField(
                        controller: controller.searchTextController,
                        onChanged: controller.onChanged,
                        autofocus: true,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: StringResources.search,
                          hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 20,
                          ),
                        ),
                      ),
                actions: [
                  // IconButton(
                  //     icon: Icon(
                  //       controller.searchBoolean.value == false
                  //           ? Icons.search
                  //           : Icons.close,
                  //       size: 40,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: controller.searchIconOnTap),
                  Stack(children: [
                    IconButton(
                        iconSize: 40,
                        onPressed: () {
                          controller.detailsListAdd();
                          controller.screenNavigation(Screens.groceryStoreScreen);
                        },
                        icon: const Icon(
                          Icons.local_grocery_store,
                          color: Colors.white,
                        )),
                    Positioned(
                        top: 1,
                        right: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            controller.total.value.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ))
                  ]),
                  GestureDetector(
                    onTap: () {
                      controller.screenNavigation(Screens.userDetailScreen);
                    },
                    child: ClipRect(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.blueGrey, shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            Singleton.getInitials(Singleton.getString('name')),
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ))),
                    ),
                  )
                ],
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    GroceryListModel values =
                        controller.searchBoolean.value == true
                            ? controller.searchList[index]
                            : controller.modelList[index];
                    if (values.count != 0) {
                      controller.selectedIndexList.add(index);
                      controller.selectedIndexList.value =
                          controller.selectedIndexList.toSet().toList();
                    }
                    return ListTile(
                      tileColor:
                          values.count != 0 ? Colors.cyanAccent : Colors.orange,
                      leading: const Icon(Icons.ac_unit),
                      title: Text(values.name),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (values.count > 0) {
                                    values.count--;
                                    controller.change(values.count);
                                    controller.total--;
                                    controller.change(controller.total);
                                  }
                                },
                                child: const Icon(Icons.remove)),
                            Text(
                              values.count.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            GestureDetector(
                                onTap: () {
                                  values.count++;
                                  controller.change(values.count);
                                  controller.total++;
                                  controller.change(controller.total);
                                },
                                child: const Icon(Icons.add)),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: controller.searchBoolean.value == true
                      ? controller.searchList.length
                      : controller.modelList.length),
              bottomNavigationBar: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.detailsListAdd();
                        controller.screenNavigation(Screens.groceryStoreScreen);
                      },
                      child: const Text(
                        StringResources.buy,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      )))));
    });
  }
}
