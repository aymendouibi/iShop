import 'package:flutter/material.dart';
import 'package:ishop/Constants/const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ishop/Screens/pages/detail/productDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class MyTrending extends StatelessWidget {
  const MyTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: products.length,
        itemBuilder: (context, index) {
       
         
       
          return  products[index]['trending']? InkWell(
            onTap: () => Get.to(MyDetail(products[index])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Card(
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CachedNetworkImage(
                  imageUrl:products[index]['image'],
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
                            products[index]['name'],
                            style: GoogleFonts.lato(
                                  color: primaryColor,
                    textStyle: Theme.of(context).textTheme.titleMedium)
                          ),
                          
                          const SizedBox(height: 7.0),
                          Text(
                            '\$${products[index]['price']}',
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
          ):Container();
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
    );
  }
}