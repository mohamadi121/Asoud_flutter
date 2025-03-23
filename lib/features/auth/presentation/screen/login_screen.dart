// ignore_for_file: deprecated_member_use, avoid_print, unnecessary_import

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../blocs/login_bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController controller = TextEditingController();
  static const routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //background
              Image.asset('assets/images/login.png', fit: BoxFit.cover),

              //logo
              Positioned(
                top: 30,
                right: Dimensions.width * 0.25,
                left: Dimensions.width * 0.25,
                height: Dimensions.height * 0.1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/asood.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),

              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.success &&
                      state.termStatus == true) {
                    /*     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpScreen()),
                    ); */
                    context.router.replace(const OtpRoute());
                  }
                  if (state.status == LoginStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colora.primaryColor,
                        content: Text(
                          "کد ارسال نشد",
                          style: TextStyle(color: Colora.scaffold),
                        ),
                      ),
                    );
                    print(state.error);
                  }
                },
                builder: (context, state) {
                  ///دقت کن این بیلدر پایینی رو اضافه گذاشتم
                  ///نذاشتنی خطا میده وو تو خطا توضیح داده یه سری چیزا بعد دیدم بیلدر گذاشتم طبق توضیح درست شد
                  ///اما اصولا نباید اینطور باشه دنبال راه حل بهتر میگردم براش
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 145),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //checkbox
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                margin: const EdgeInsets.only(left: 5),
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: Colora.scaffold,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    checkColor: Colora.primaryColor,
                                    side: const BorderSide(
                                      color: Colora.scaffold,
                                    ),
                                    value: state.termStatus,
                                    onChanged: (value) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        ToggleTermsCheckboxEvent(
                                          isClicked: value!,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ), // Replace with your checkbox logic
                              const Row(
                                children: [
                                  Text(
                                    'توافق نامه کاربری',
                                    style: TextStyle(
                                      color: Colora.lightBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' را خوانده قبول دارم',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 20,
                                top: 10,
                              ),
                              height: 50,
                              width: Dimensions.width * .8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: IntlPhoneField(
                                textAlign: TextAlign.start,
                                controller: controller,
                                searchText: "جستجو کشور",
                                languageCode: 'fa',
                                decoration: const InputDecoration(
                                  counter: Offstage(),
                                  hintTextDirection: TextDirection.rtl,
                                  contentPadding: EdgeInsets.only(top: 4),
                                  hintText: 'شماره تلفن:',

                                  hintStyle: TextStyle(color: Colora.lightBlue),
                                  hintFadeDuration: Duration.zero,
                                  alignLabelWithHint: true,
                                  // labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                  errorText: null,
                                ),
                                initialCountryCode: 'IR',
                                showCountryFlag: true,
                                autovalidateMode: AutovalidateMode.disabled,
                                dropdownIconPosition: IconPosition.trailing,
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            onPressed: () {
                              String phone = "0${controller.text}";
                              if (state.termStatus == true) {
                                if (controller.text.isNotEmpty) {
                                  context.read<LoginBloc>().add(
                                    SendOtp(phone: phone),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colora.primaryColor,
                                      content: Text(
                                        "لطفا شماره تلفن خود را وارد کنید",
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colora.primaryColor,
                                    content: Text(
                                      "بدون پذیرفتن قوانین و مقررات امکان استفاده از آسود نمیباشد!",
                                      style: TextStyle(color: Colora.scaffold),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: Dimensions.width * 0.25,
                              height: Dimensions.height * 0.04,
                              alignment: Alignment.center,
                              child:
                                  state.status == LoginStatus.loading
                                      ? Transform.scale(
                                        scale: 0.6,
                                        child: const CircularProgressIndicator(
                                          color: Colora.primaryColor,
                                        ),
                                      )
                                      : const Center(
                                        child: Text(
                                          "ارسال کد تایید",
                                          style: TextStyle(
                                            color: Colora.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
