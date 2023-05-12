import 'package:fluency_therapist/controller/auth_screens_controller/login_screen_controller.dart';

import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal on 6-5-2023

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 10,top: 40),
                    child: Container(
                      height: _mediaQuery.size.width * 0.3,
                      width: _mediaQuery.size.height * 0.12,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 20,top: 40),
                    child: Text(
                      'fluency\ntherapist',
                      style: TextStyle(fontSize: 25, fontFamily: 'FontMain'),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                ),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text("Welcome back! Lets continue",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'FontMain',
                        )),
              ),


              const Padding(
                padding:
                EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 12,

                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: TextFormField(
                    controller: controller.emailTEController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                ),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 12,

                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: Obx(
                        () => TextFormField(
                      controller: controller.passwordTEController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.obscureText.value =
                              !controller.obscureText.value;
                            },
                            child: Icon(controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          prefixIcon: const Icon(Icons.lock_open_outlined)),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscureText.value,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(child: Text('Forgot Password?',)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Center(
                  child: Container(
                    height: _mediaQuery.size.height * 0.07,
                    width: _mediaQuery.size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: TextButton(
                        onPressed: () {
                          //GetUtils.isLengthGreaterThan(EmailController.text, 6) ? print('email is valid') : print('email is invalid');
                          controller.onLoginTap();
                        },
                        child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: 'FontMain',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10,right: 10),
                    child: Container(
                      height: _mediaQuery.size.height*0.0009,
                      width:  _mediaQuery.size.height*0.1,
                      color: Colors.grey,


                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text('OR'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10,right: 10),
                    child: Container(
                      height: _mediaQuery.size.height*0.0009,
                      width:  _mediaQuery.size.height*0.1,
                      color: Colors.grey,


                    ),

                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Center(
                  child: Container(
                    height: _mediaQuery.size.height * 0.07,
                    width: _mediaQuery.size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12),
                    child: TextButton(

                        onPressed: () {
                          //GetUtils.isLengthGreaterThan(EmailController.text, 6) ? print('email is valid') : print('email is invalid');
                          controller.onLoginTap();
                        },
                        

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.asset('assets/images/google-logo.png'),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Login with google",
                                style: TextStyle(
                                    fontFamily: 'FontMain',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),

                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Not User?',)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Register Here',style: TextStyle(color: Colors.blueAccent),)),
                  ),


                ],

              ),


              
            ],
          ),
        ),
      ),
    );
  }


}
