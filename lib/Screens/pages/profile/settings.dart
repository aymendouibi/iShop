import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishop/Constants/firebase_constants.dart';


import 'package:ishop/Controllers/auth_controller.dart';class MySettings extends StatelessWidget {
   MySettings({super.key});
final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //profile
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Profile Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: () {},
            child:   SizedBox(
              height: 120,
              child: Card(
                child: Row(
                  children: [
                    const SizedBox(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://www.woolha.com/media/2020/03/eevee.png'),
                      ),
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          auth.currentUser!.email==null?"":"${auth.currentUser!.email}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_sharp),
                  ],
                ),
              ),
            ),
          ),
          //dark mode
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'More Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                InkWell(
                  child: Row(
                    children: [
                      SettingMenu(
                        function: () {},
                        text: 'Contact us',
                        icon: Icons.phone,
                        color: Colors.green,
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 179, 179, 179),
                  thickness: 1.0,
                ),
                InkWell(
                  onTap: (){
                    authController.signOut();
                  },
                  child: Row(
                    children: [
                      SettingMenu(
                        function: () {
                          authController.signOut();
                        },
                        text: 'Logout',
                        icon: Icons.logout,
                        color: Colors.red,
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingMenu extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  Function function;

  SettingMenu({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: () {
          function;
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.23),
              child: Icon(icon, color: color),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
