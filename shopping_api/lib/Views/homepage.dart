import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_api/Controller/productController.dart';

import 'package:shopping_api/Views/favorite.dart';
import 'package:shopping_api/Views/pro_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCOntroller productCOntroller = Get.put(ProductCOntroller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ShopX',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.view_list_rounded)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.grid_view)),
                ],
              ),
            ),
            Expanded(child: Obx(() {
              if (productCOntroller.isloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return AlignedGridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    itemCount: productCOntroller.productList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                porduct: productCOntroller.productList[index]));
                          },
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 90),
                                ),
                                Stack(children: [
                                  Container(
                                    height: 180,
                                    width: Get.width,
                                    child: Image.network(
                                      productCOntroller
                                          .productList[index].imageLink,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, bottom: 8),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: FavoriteIcon()),
                                  )
                                ]),
                                Text(
                                  productCOntroller.productList[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 90),
                                  child: Container(
                                    height: 22,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 2),
                                          child: Text(
                                            productCOntroller
                                                .productList[index].rating
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${productCOntroller.productList[index].price}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            })),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          backgroundColor: Colors.cyan,
          index: 2,
          color: Colors.amber,
          items: [
            Icon(Icons.category),
            Icon(Icons.search),
            Icon(Icons.favorite),
            Icon(Icons.home),
            Icon(Icons.phone),
            // Icon(Icons.photo_album)
          ]),
    );
  }
}
