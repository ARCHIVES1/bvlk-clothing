import 'dart:core';

import 'package:get/get.dart';

class CartController extends GetxController {
  final RxInt selectedIndex = (-1).obs;

  var currentIndex = 0.obs;
  var isBottomBarVisible = true.obs; 

  void changeTabIndex(int index) {
    currentIndex.value = index;
    isBottomBarVisible.value = false; 
  }

  void showBottomBar() {
    isBottomBarVisible.value = true; 
  }

  var cartItems = [
    {
      "name": "clothing 1",
      "size": "Medium Size",
      "price": 317,
      "quantity": 0,
      "image": "Assets/images/shirt 1.jpg",
      "selected": false,
    },
    {
      "name": "street cup",
      "size": "Medium Size",
      "price": 269,
      "quantity": 0,
      "image": "Assets/images/cup.jpg",
      "selected": false,
    },
    {
      "name": "bvlk shirt white",
      "size": "Medium Size",
      "price": 317,
      "quantity": 0,
      "image": "Assets/images/1.jpg",
      "selected": false,
    },
    {
      "name": "bvlk shirt black",
      "size": "Medium Size",
      "price": 428,
      "quantity": 0,
      "image": "Assets/images/2.jpg",
      "selected": false,
    },
    {
      "name": "bvlk shirt pink",
      "size": "Medium Size",
      "price": 247,
      "quantity": 0,
      "image": "Assets/images/3.jpg",
      "selected": false,
    },
    {
      "name": "Bvlk shirt cream",
      "size": "Medium Size",
      "price": 381,
      "quantity": 0,
      "image": "Assets/images/5.jpg",
      "selected": false,
    },
    {
      "name": "bvlk skyblue",
      "size": "Medium Size",
      "price": 377,
      "quantity": 0,
      "image": "Assets/images/6.jpg",
      "selected": false,
    },
    {
      "name": "signatures shirt ",
      "size": "Medium Size",
      "price": 329,
      "quantity": 0,
      "image": "Assets/images/model 3.jpg",
      "selected": false,
    },
  ].obs;
  List selectImage = [].obs;
  var selectedCount = 0.obs;
  RxBool isAnyItemSelected = false.obs;
  var isCheckboxSelected = false.obs;
  RxInt selectedItemsCount = 0.obs;

  RxList<bool> selectedItems = <bool>[].obs;

  void initializeSelection(int length) {
    selectedItems.assignAll(List.generate(length, (index) => false));
  }

  void updateCheckboxState(int index, bool isSelected) {
    cartItems[index]["isSelected"];
    cartItems[index] = {...cartItems[index], "selected": isSelected};
    cartItems.refresh();

    isAnyItemSelected.value = cartItems.any((item) => item["selected"] == true);
    selectedItems[index] = isSelected;
    if (isSelected) {
      selectedItemsCount++;
    } else {
      selectedItemsCount!;
    }
    update();
  }

  void increment() {
    selectedCount.value++;
  }

  void decrement() {
    if (selectedCount.value > 0) {
      selectedCount.value--;
    }
  }

  void deselectAll() {
    for (var item in cartItems) {
      item["selected"] = false;
    }
    cartItems.refresh();
  }

  void toggleAllSelection(bool) {
    var allSelected = cartItems.every((item) => item["selected"] == true);
    cartItems.value =
        cartItems.map((item) => {...item, "selected": !allSelected}).toList();
    cartItems.refresh();
  }

  void incrementQuantity(int index) {
    cartItems[index] = {
      ...cartItems[index],
      "quantity": (cartItems[index]["quantity"] as int) + 1
    };
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if ((cartItems[index]["quantity"] as int) > 0) {
      cartItems[index] = {
        ...cartItems[index],
        "quantity": (cartItems[index]["quantity"] as int) - 1
      };
      cartItems.refresh();
    }
  }

  // Check if any checkbox is selected
  bool get isAnyCheckboxSelected =>
      cartItems.any((item) => item["isSelected"] == true);



  void toggleSelection(int index, bool? value) {
    cartItems[index] = {...cartItems[index], "selected": value ?? false};
    cartItems.refresh();
  }

  double get totalPrice =>
      cartItems.where((item) => item["selected"] == true).fold(
          0.0,
          (sum, item) =>
              sum + (item["price"] as int) * (item["quantity"] as int));
}
