import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishop/Constants/const.dart';
import 'package:ishop/Screens/pages/home/product/product.dart';
import 'package:ishop/Screens/pages/home/product/trending.dart';
import 'package:google_fonts/google_fonts.dart';
class MyHome extends StatelessWidget {
  final _tabController = Get.put(MyTabController());

  MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight:120,
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
                      const SizedBox(height: 15,),
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
                    
                            hintText: 'Search Products',
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search,),
                            
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
                bottom: TabBar(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  controller: _tabController.controller,
                  indicator: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  labelColor: const Color.fromRGBO(238, 248, 254, 1),
                  unselectedLabelColor: primaryColor,
                  tabs: const [
                    Tab(
                      text: 'Clothing',
                    ),
                    Tab(
                      text: 'Trending',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController.controller,
            children: [
              ProductListScreen(),
              const MyTrending(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 2, vsync: this);
    controller.index = 0;
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

/**  appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Column(
          children: [
            Text(
              "iShop",
              style: TextStyle(color: primaryColor),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: primaryColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
            child: Column(
          children: [
            
            const SizedBox(
              height: 20,
            ),
            TabBar(
              
              controller: _tabController.controller,
              indicator:  BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(50)),
              labelColor: const Color.fromRGBO(238, 248, 254, 1),
              unselectedLabelColor: primaryColor,
              tabs:  const [
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Clothing',
                ),
              ],
              
            ),
            Expanded(
            child: TabBarView(
              controller: _tabController.controller,
              children:  <Widget>[
                ProductListScreen(),
                const Text('Tab 2 content'),
              ],
            ),
          ),
          ],
        )),
      ), */