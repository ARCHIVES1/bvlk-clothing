import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var products = <ProductModel>[
    ProductModel(
      name: "aruga shirt",
      image: "Assets/images/blv shirt.jpg",
      price: 200,        
      discountPrice: 99, 
    ),
    ProductModel(
      name: "Evil eye shirt",
      image: "Assets/images/evil eye shirt.jpg",
      price: 250,        
      discountPrice: 99, 
      isFavorite: true,
    ),
    ProductModel(
      name: "BLVCK",
      image: "Assets/images/bvlck.jpg",
      price: 250,       
      discountPrice: 99, 
      isFavorite: true,
    ),
    ProductModel(
      name: "Blvk Tshirt",
      image: "Assets/images/shirt bvlk.jpg",
      price: 230,        
      discountPrice: 80, 
    ),
    ProductModel(
      name: "bonet argki",
      image: "Assets/images/bonet.jpg",
      price: 120,        
      discountPrice: 0,  
      isFavorite: true,
    ),
    ProductModel(
      name: "Signature design",
      image: "Assets/images/model shirt.jpg",
      price: 899,        
      discountPrice: 150,
    ),
  ].obs;

  void toggleFavorite(int index) {
    products[index].isFavorite = !products[index].isFavorite;
    products.refresh();
  }
}
