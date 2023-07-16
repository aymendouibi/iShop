import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ishop/Constants/const.dart';
import 'package:ishop/Screens/pages/home/product/productController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ishop/Screens/pages/detail/productDetails.dart';
class ProductListScreen extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

   ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
                        init: ProductController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => 
                        _productController.isLoading.value?const Center(
          child: SpinKitWave(
                                  color: Colors.blueAccent,
                                  size: 50.0,
                                ),
        ): Padding(
          padding: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: _productController.products.length,
            itemBuilder: (context, index) {
              products.add(_productController.products[index]);
              if (_productController.products[index]['trending']==true){trendingLentgh++;


              }
              final product = _productController.products[index];
        
              return ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: InkWell(
                  onTap: (){
                    Get.to(MyDetail(product));
                  },
                  child: Card(
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CachedNetworkImage(
                  imageUrl:product['image'],
                  placeholder: (context, url) =>  Container(
                    color: const Color.fromARGB(80, 158, 158, 158),
                    height: 200,
                    width: 50,
                    child: const SpinKitPulsingGrid(
                    color: Colors.blueAccent,
                    size: 50.0,
                    
                  ),
                  ),
                  errorWidget: (context, url, error) => Container(height: 200,
                    width: 50,color: const Color.fromARGB(80, 158, 158, 158),child: const Icon(Icons.error)),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text(
                                product['name'],
                                style: GoogleFonts.lato(
                                      color: primaryColor,
                        textStyle: Theme.of(context).textTheme.titleMedium)
                              ),
                              
                              const SizedBox(height: 7.0),
                              Text(
                                '\$${product['price']}',
                               style: GoogleFonts.lato(
                                      color: primaryColor,
                        textStyle: Theme.of(context).textTheme.titleLarge,fontWeight: FontWeight.bold)
                              ),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
        ),
                        )
    );
  }
}
