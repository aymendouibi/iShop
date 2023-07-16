import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishop/Screens/pages/explore/category.dart';
import '../../../Constants/const.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MyExplore extends StatelessWidget {
  const MyExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 120,
                elevation: 0,
                pinned: true,
                backgroundColor: Colors.white,
                floating: true,
                title: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text(
                            "iShop",
                            style: GoogleFonts.roboto(color: primaryColor,textStyle: const TextStyle(letterSpacing: 3,fontWeight: FontWeight.bold,fontSize: 23)),
                          ),
                          IconButton(
                           icon: const Icon(Icons.notifications_rounded,
                            color: primaryColor,),
                            onPressed: (){Get.snackbar("Not Working", "this features is currently not working",snackPosition: SnackPosition.BOTTOM);},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                            hintText: 'Search Category',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
            child: ListView.builder(
              itemCount: categoies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(MyCategory(category: categoies[index]['name']! ));
                    },
                    child: SimpleShadow(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: Get.height * 0.25,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                               imageUrl: categoies[index]['image']!,
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Colors.grey.withOpacity(0.0),
                                          const Color.fromARGB(225, 2, 2, 2),
                                        ],
                                        stops: const [
                                          0.0,
                                          1.0
                                        ])),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20.0, left: 30),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      categoies[index]['name']!.toUpperCase(),
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineSmall)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
