import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishop/Screens/auth/login.dart';

import '../../Constants/const.dart';
import '../../Constants/textfield.dart';
import '../../Controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _RegisterState();
}

class _RegisterState extends State<MyRegister> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final authController = Get.put(AuthController());

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            
            children: [
              
               SizedBox(
                height: Get.height*0.15,
              ),
             SimpleShadow(
              color: Colors.blueAccent,
               child: Text("Start Your Journey", style: GoogleFonts.roboto(
                     textStyle: const TextStyle(
                       fontSize: 35,
                       fontWeight: FontWeight.bold,
                       color: primaryColor
                     ),)),
             ),
            SizedBox(
                height: Get.height*0.15*0.5,
              ),
               MyTextField(
                    controller: _emailController,
                    hint: "Email",
                  ),
                   const SizedBox(
                height: 19,
              ),
              MyTextField(
                controller: _passwordController,
                hint: 'Password',
                obscure: true,
              ),
               const SizedBox(
                height: 19,
              ),
               MyTextField(
                    controller: _nameController,
                    hint: "Full name",
                  ),
                 
              const Spacer(),
              InkWell(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already a user ? ',
                          style: TextStyle(
                            color: Get.isDarkMode? Colors.white:Colors.black,
                            fontSize: 16,
                          )),
                      const TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                onTap: () {
                  Get.offAll( const MyLogin());
                },
              ),
             const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () async {
                   authController.register(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                  _nameController.text.trim(),
                );
                    
                     
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor:  primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<AuthController>(
                        init: AuthController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => authController.isloading.value
                            ? const SpinKitWave(
                                color: Colors.blueAccent,
                                size: 20.0,
                              )
                            : const Text("Sign up",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5,),
             ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(244, 235, 235, 235),
                ),
                onPressed: () {
                //  authController.signInWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png',height: 20,),
                      const SizedBox(width: 7,),
                       Text("Sign up with google",style: TextStyle(
                              fontSize: 18,
                              color: primaryColor.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                            ))
                    ],
                  ),
                ),
              
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

