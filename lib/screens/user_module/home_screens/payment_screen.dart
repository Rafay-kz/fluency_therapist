import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/custom%20widgets/button.dart';
import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../controller/user_screens_controller/home_screens_controller/ongoing_call_screen_controller.dart';
import '../../../controller/user_screens_controller/home_screens_controller/payment_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class PaymentScreen extends GetView<PaymentScreenController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.88;
    final screenHeight = MediaQuery.of(context).size.height * 0.88;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth * 0.10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenWidth * 0.02),
                      child: Center(
                        child: Image(
                          image: const AssetImage(logoIcon),
                          width: screenWidth * 0.42,
                          height: screenHeight * 0.070,
                        ),
                      ),
                    ),
                    Obx(
                      () => CircleAvatar(
                        radius: screenWidth * 0.057,
                        backgroundImage: controller.doctorModel.value.image != ''
                            ? CachedNetworkImageProvider(
                                controller.doctorModel.value.image)
                            : (controller.userModel.value.image != ''
                                ? CachedNetworkImageProvider(
                                    controller.userModel.value.image)
                                : const AssetImage('assets/images/person.png')
                                    as ImageProvider),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                      bottom: screenHeight * 0.02,
                      left: screenWidth * 0.013),
                  child: Row(
                    children: [
                      Text(
                        "Enter Card Details",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: screenWidth * 0.045),
                      ),
                    ],
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.cardNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          prefixIcon: Icon(Icons.credit_card),
                        ),
                        validator: controller.validateCardNumber,
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.expiryDateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Expiry Date',
                                prefixIcon: Icon(Icons.calendar_today),
                              ),
                              validator: controller.validateExpiryDate,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: controller.cvvController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: controller.validateCVV,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: controller.amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        validator: controller.validateAmount,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                Button(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        Utils().toastMessage2("Appointment Booked Successfully!");
                        Get.offNamed(kBookedAppointmentScreen);
                      }
                    },
                    text: "Pay")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
