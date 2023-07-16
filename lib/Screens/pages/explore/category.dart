import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ishop/Constants/const.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCategory extends StatelessWidget {
  String category;
  MyCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
      appBar: AppBar(title: Text(category,),backgroundColor: Colors.black,centerTitle: true,),
      body:  Padding(
          padding: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: products.length,
            itemBuilder: (context, index) {
           
             
       
              return  products[index]['category'].toString().toUpperCase()==category.toUpperCase()? ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Card(
                  elevation: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        products[index]['image'],
                        fit: BoxFit.fitHeight,
                        
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
              ):Container();
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
        ),
      
    );
  }
}