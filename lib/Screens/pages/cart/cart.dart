import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../Constants/const.dart';
import '../detail/productDetails.dart';
import 'cartController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CartController>(
            init: CartController(), // INIT IT ONLY THE FIRST TIME
            builder: (_) =>cartController.cartProducts.isEmpty?const Center(child: Text('Cart is Empty')): Container(
                  child: cartController.isLoading.value
                      ? const Center(
                          child: SpinKitWave(
                            color: Colors.blueAccent,
                            size: 50.0,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: cartController.cartProducts.length,
                            itemBuilder: (context, index) {
                             

                              final product =
                                  cartController.cartProducts[index]['product'];

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(MyDetail(product));
                                  },
                                  child: Card(
                                    elevation: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          
                                          children: [
                                            CachedNetworkImage(
                                              width: Get.width * 0.4,
                                              height: Get.height * 0.25,
                                              fit: BoxFit.cover,
                                              imageUrl: product['image'],
                                              placeholder: (context, url) =>
                                                  Container(
                                                color: const Color.fromARGB(
                                                    80, 158, 158, 158),
                                                height: 200,
                                                width: 50,
                                                child: const SpinKitPulsingGrid(
                                                  color: Colors.blueAccent,
                                                  size: 50.0,
                                                ),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Container(
                                                      height: 200,
                                                      width: 50,
                                                      color:
                                                          const Color.fromARGB(
                                                              80,
                                                              158,
                                                              158,
                                                              158),
                                                      child: const Icon(
                                                          Icons.error)),
                                            ),
                                            const SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(product['name'],
                                                    style: GoogleFonts.lato(
                                                        color: primaryColor,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleMedium)),
                                                const SizedBox(height: 10.0),
                                                Text('\$${product['price']}',
                                                    style: GoogleFonts.lato(
                                                        color: primaryColor,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleLarge,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Quantity: x${cartController.cartProducts[index]['quantity']}',
                                                    style: GoogleFonts.lato(
                                                        color: primaryColor,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleSmall,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                const StaggeredTile.fit(2),
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                          ),
                        ),
                )));
  }
}
