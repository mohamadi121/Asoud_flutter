import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_router.dart';
import 'package:asood/core/widgets/custom_bottom_navbar.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/default_appbar.dart';

@RoutePage()
class SettingsPageScreen extends StatelessWidget {
  const SettingsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context: context, title: 'تنظیمات'),
      body: SafeArea(
        child: Container(
          height: Dimensions.height,
          width: Dimensions.width,
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    onPress: () {},
                    text: 'تنظیمات پنل',
                    height: Dimensions.height * 0.05,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {
                      context.router.push(const StoreInfoRoute());
                      /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StoreInfoScreen(),
                        ),
                      ); */
                    },
                    text: 'اطلاعات فروشگاه',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {
                      context.router.push(const JobManagementRoute());
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JobManagementScreen(),
                        ),
                      ); */
                    },
                    text: 'مدیریت مشاغل',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'اطلاعات کالا‌ها',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'اطلاعات کاربران',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'مدیریت اصناف',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'مدیریت دسته‌بندی کالاها',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'هزینه ثبت مشاغل',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'مدیریت نیازمندی‌ها',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'مشخصات نوبت گیرنده',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'ساخت کد تخفیف',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'تعیین مبلغ پورسانت',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'لیست گزارش اسپم فروشگاه‌ها',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () {},
                    text: 'لیست گزارش اسپم کالاها',
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(onPress: () {}, text: 'تبلیغات', height: 40),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPress: () async {
                      // final IsarObjectService _isarService =
                      // IsarObjectService<KeyValue>(KeyValueSchema);
                      // print(await _isarService.getValueByKey('token'));
                      // // KeyValue token = KeyValue(
                      // //   key: "token",
                      // //   value: json["data"]["token"],
                      // // );
                      // await _isarService.delete(1);
                    },
                    text: 'خروج',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildButton(String buttonText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Add button-specific logic here
          print('$buttonText pressed!');
        },
        child: Text(buttonText),
      ),
    );
  }
}
