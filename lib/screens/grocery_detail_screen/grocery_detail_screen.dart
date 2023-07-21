import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/models/grocery_list_model.dart';
import 'package:grocery_application/screens/grocery_detail_screen/grocery_detail_screen_controller.dart';
import 'package:grocery_application/utils/string_resource.dart';

class GroceryDetailScreen extends StatefulWidget {
  static const String routeName = '/groceryDetailScreen';

  const GroceryDetailScreen({super.key});

  @override
  State<GroceryDetailScreen> createState() => _GroceryDetailScreenState();
}

class _GroceryDetailScreenState extends State<GroceryDetailScreen> {
  GroceryDetailScreenController controller =
      Get.put(GroceryDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroceryDetailScreenController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(StringResources.groceryDetails),
          ),
          body: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.storeController.selectedStoreList.length,
            itemBuilder: (context, index) {
              controller.priceLists =
                  controller.storeController.priceList[index];
              return Column(
                children: [
                  ListTile(
                    tileColor: Colors.lightGreen,
                    title: Text(
                        controller.storeController.selectedStoreList[index]),
                    trailing: Obx(() {
                      return Checkbox(
                        onChanged: (value) {
                          controller.listTileSelect(value!, index);
                        },
                        value: controller.storesCheckbox[index],
                      );
                    }),
                  ),
                  childrenListBuilder(),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
          bottomNavigationBar: controller.isEnable.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(StringResources.pay),
                  ),
                )
              : null);
    });
  }

  childrenListBuilder() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.groceryController.groceryDetailList.length,
      itemBuilder: (context, index) {
        GroceryListModel val =
            controller.groceryController.groceryDetailList[index];
        int price = controller.priceLists[index];
        int total = val.count * price;
        controller.totalValues.add(total);

        return ListTile(
            tileColor: Colors.black12,
            title: Text(val.name),
            subtitle: Text(val.details),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(val.count.toString()),
                const SizedBox(width: 2),
                const Text("*"),
                Text(" ${price.toString()}"),
                const SizedBox(width: 2),
                const Text("="),
                const SizedBox(width: 2),
                Text("₹ ${total.toString()}")
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
