import 'package:flutter/material.dart';
import 'package:ishop/Constants/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ishop/Screens/pages/detail/productDetailsController.dart';
import 'package:simple_shadow/simple_shadow.dart';

class MyDetail extends StatelessWidget {
  var product;

  MyDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final detailControllerr = Get.put(detailController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SimpleShadow(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: product['image'],
                    height: Get.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              product['trending']
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          color: const Color.fromARGB(255, 1, 43, 116),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('#Trending',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium)),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(product['name'],
                    style: GoogleFonts.prozaLibre(
                        color: const Color.fromARGB(255, 1, 18, 49),
                        textStyle: const TextStyle(
                            letterSpacing: 3,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))),
                Text('\$${product['price']}',
                    style: GoogleFonts.prozaLibre(
                        color: const Color.fromARGB(255, 1, 43, 116),
                        textStyle: const TextStyle(
                            letterSpacing: 3,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 20,
                ),
                Text("Description",
                    style: GoogleFonts.prozaLibre(
                        color: const Color.fromARGB(255, 1, 18, 49),
                        textStyle: const TextStyle(
                            letterSpacing: 3,
                            fontSize: 20,
                            fontWeight: FontWeight.normal))),
                Text(product['Description'],
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 1, 18, 49),
                        fontSize: 15)),
              ],
            ),
          ),
          const Spacer(),
          GetBuilder<detailController>(
              init: detailController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  detailControllerr.increment();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 43, 116),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Text("+"),
                                ),
                              ),
                              
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                      elevation: 0
                                ),
                                child: Text('${detailControllerr.counter.value}',style: const TextStyle(color: Colors.black),),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  detailControllerr.decrement();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 43, 116),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Text("-"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () {
                                detailControllerr.addToCart(product, detailControllerr.counter.value);
              
              
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(13.0),
                                child: Text('add to cart'),
                              )),
                        ),
                      ],
                    ),
              )),
                  const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
