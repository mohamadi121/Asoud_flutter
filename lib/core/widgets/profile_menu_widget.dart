import 'package:flutter/material.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/core/utils/secure_storage.dart';
import 'package:go_router/go_router.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class ProfileDialog1 extends StatelessWidget {
  const ProfileDialog1({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: Alignment.topLeft,
      title: const Text("پروفایل"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add your login form here
          // For example, you can use TextFormField for username and password
          // with a login button.
          Column(
            children: [
              CustomTextField(
                controller: TextEditingController(),
                text: "نام کاربری",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: TextEditingController(),
                text: "کلمه عبور",
              ),
              const SizedBox(height: 10),
              CustomButton(onPress: () {}, text: "ورود"),
            ],
          ),
          // Add a SizedBox or Divider for separation
          const SizedBox(height: 10),

          // Forgot Password Button
          ElevatedButton(
            onPressed: () {
              // Add logic to handle forgot password
            },
            child: const Text("رمز عبور خود را فراموش کرده‌اید؟"),
          ),

          // Signup Button
          ElevatedButton(
            onPressed: () {
              // Add logic to handle signup
            },
            child: const Text("عضویت"),
          ),
        ],
      ),
    );
  }
}

void showProfileDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ProfileDialog();
    },
  );
}

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: Alignment.topLeft,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //profile
          InkWell(
            onTap: () {
              context.push(Routes.vendorProfile);
            },
            child: Container(
              height: Dimensions.height * 0.05,
              margin: EdgeInsets.symmetric(vertical: Dimensions.height * 0.01),
              decoration: BoxDecoration(
                color: Colora.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'پروفایل',
                  style: TextStyle(
                    color: Colora.scaffold,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.width * 0.035,
                  ),
                ),
              ),
            ),
          ),

          //contact
          Container(
            height: Dimensions.height * 0.05,
            margin: EdgeInsets.symmetric(vertical: Dimensions.height * 0.01),
            decoration: BoxDecoration(
              color: Colora.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'تماس با ما',
                style: TextStyle(
                  color: Colora.scaffold,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.width * 0.035,
                ),
              ),
            ),
          ),

          //logout account
          InkWell(
            onTap: () {
              SecureStorage().deleteSecureStorage('token');

              context.go(Routes.login);
            },
            child: Container(
              height: Dimensions.height * 0.05,
              margin: EdgeInsets.symmetric(vertical: Dimensions.height * 0.01),
              decoration: BoxDecoration(
                color: Colora.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'خروج از حساب کاربری',
                  style: TextStyle(
                    color: Colora.scaffold,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.width * 0.035,
                  ),
                ),
              ),
            ),
          ),

          //exit app
          Container(
            height: Dimensions.height * 0.05,
            margin: EdgeInsets.symmetric(vertical: Dimensions.height * 0.01),
            decoration: BoxDecoration(
              color: Colora.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'خروج از برنامه',
                style: TextStyle(
                  color: Colora.scaffold,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.width * 0.035,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
