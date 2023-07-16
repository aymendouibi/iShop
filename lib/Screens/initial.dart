import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ishop/Screens/pages/cart/cart.dart';
import 'package:ishop/Screens/pages/explore/explore.dart';
import 'package:ishop/Screens/pages/home/home.dart';
import 'package:ishop/Screens/pages/profile/settings.dart';

import '../Constants/const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
     MyHome(),
    const MyExplore(),
    MyCart(),
     MySettings(),
   
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        
        body: SafeArea(child: tabItems[_selectedIndex]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10,right: 20,left: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FlashyTabBar(
              backgroundColor:  primaryColor,
              animationCurve: Curves.linear,
              selectedIndex: _selectedIndex,
              iconSize: 30,
              showElevation: false, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  activeColor : Colors.blueAccent,
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                
                FlashyTabBarItem(
                  activeColor : Colors.blueAccent,
                  icon: const Icon(Icons.explore),
                  title: const Text('Explore'),
                ),
                FlashyTabBarItem(
                  activeColor : Colors.blueAccent,
                  icon: const Icon(Icons.shopping_cart),
                  title: const Text('Cart'),
                ),
                FlashyTabBarItem(
                  activeColor : Colors.blueAccent,
                  icon: const Icon(Icons.person),
                  title: const Text('Profile'),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}