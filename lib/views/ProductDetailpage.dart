import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/ProdectDetailsCOntroller.dart';
import 'home_page.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String size;
  final int price;
  final int quantity;
  final String imagePath;

  ProductDetailPage({
    Key? key,
    required this.name,
    required this.size,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required bool isSelected,
  }) : super(key: key);

  final ProductDetailController controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    List<String> displayImages = [
      imagePath,
      "Assets/images/pic 1.jpg",
      "Assets/images/pic 2.jpg",
      "Assets/images/pic 4.jpg"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          PageView.builder(
                            controller: PageController(),
                            itemCount: displayImages.length,
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (index) {
                              controller.pageIndex.value = index;
                            },
                            itemBuilder: (context, index) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(displayImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 20,
                            child: Obx(() => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    displayImages.length,
                                    (index) => Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: controller.pageIndex.value == index
                                          ? 12
                                          : 8,
                                      height:
                                          controller.pageIndex.value == index
                                              ? 12
                                              : 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            controller.pageIndex.value == index
                                                ? Color(0xffF66743)
                                                : Colors.grey,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),

                    // BOTTOM CONTENT
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME + PRICE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "₱${price}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffF66743),
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 10),

                          // DESCRIPTION
                          Text(
                            'Experience the perfect combination of style and comfort with this premium product. '
                            'Crafted from high-quality materials, it ensures durability while keeping you on-trend. '
                            'Ideal for everyday wear or special occasions, this item adds a touch of elegance to your collection.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),

                          SizedBox(height: 15),

                          // SIZE SECTION
                          Text('Size',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),

                          Row(
                            children:
                                List.generate(controller.sizes.length, (index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () => controller.updateSize(index),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                        width: 2,
                                        color: controller.selectedSize.value ==
                                                index
                                            ? Color(0xffF66743)
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      controller.sizes[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: controller.selectedSize.value ==
                                                index
                                            ? Color(0xffF66743)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: 20),

                          // ADD TO CART BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Color(0xffF66743),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              Get.to(HomePage());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // BACK BUTTON
                Positioned(
                  top: 40,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),

                // FAVORITE BUTTON
                Positioned(
                  top: 40,
                  right: 20,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleFavorite(),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          controller.favorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.favorite.value
                              ? Colors.red
                              : const Color.fromARGB(255, 40, 4, 4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
