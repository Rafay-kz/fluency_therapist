import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/forget_pass_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';



class ForgetPassScreen extends GetView<ForgetPassScreenController> {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      image: const AssetImage(forgotPasswordImage),
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 110, top: 15),
                    child: Text(
                      "Forgot\nPassword?",
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, bottom: 10),
                  child: Text(
                      "Don't worry! it happens. Please enter the address associated with your account",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: Form(
                      key: controller.formKey,
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          controller: controller.emailTEController,
                          decoration: InputDecoration(
                              fillColor: AppColors.textfieldColor,
                              filled: true,
                              hintText: 'Enter your email',
                              hintStyle: Theme.of(context).textTheme.titleMedium,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.textHintColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Button(
                      onPressed: () {
                        controller.onTap();
                      },
                      text: "Reset Password",
                    ))
              ],
            ),
          ),
        ));
  }
}
