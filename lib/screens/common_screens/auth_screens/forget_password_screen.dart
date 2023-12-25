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
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(forgotPasswordImage),
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.48,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.07),
                      child: Text(
                        "Forgot\nPassword?",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: screenWidth * 0.088),
                      )),
                  SizedBox(height: screenHeight * 0.017),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text(
                        "Don't worry! it happens. Please enter the address associated with your account",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: screenWidth * 0.042,
                            )),
                  ),
                  SizedBox(height: screenHeight * 0.040),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                            contentPadding: EdgeInsets.all(screenWidth * 0.045),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: screenWidth * 0.038),
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
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Button(
                        onPressed: () {
                          controller.onTap();
                        },
                        text: "Reset Password",
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
