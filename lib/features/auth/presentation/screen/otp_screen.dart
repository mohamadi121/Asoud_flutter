import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_routers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../blocs/login_bloc/login_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static const routeName = '/otpScreen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String code = '';
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<LoginBloc>(context).state.status ==
        LoginStatus.success) {
      phoneNumber = BlocProvider.of<LoginBloc>(context).state.phoneNumber;
    }
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Center(
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state.status == LoginStatus.success) {
                          context.go(Routes.vendorHome, extra: "");
                        } else if (state.status == LoginStatus.error) {
                          if (state.error == 'Pin not valid') {
                            Fluttertoast.showToast(
                              msg: 'کد تایید اشتباه است',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Spacer(),

                            Text(
                              'آسود',
                              style: TextStyle(
                                fontSize: 55.0,
                                color: Colors.blue.shade900,
                              ),
                            ),

                            Container(
                              width: 150.0,
                              height: 2,
                              color: Colors.blue.shade900,
                            ),

                            const SizedBox(height: 20),

                            Image.asset(
                              'assets/images/logo.png',
                              width: 100,
                              height: 100,
                            ),

                            const SizedBox(height: 20),

                            Text(
                              'آسودگی خیال , با آسود',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10.0),

                            const Text(
                              'کد تایید',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colora.lightBlue,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Container(
                              width: Dimensions.width,
                              padding: const EdgeInsets.only(bottom: 10),
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.2,
                              ),
                              decoration: BoxDecoration(
                                color: Colora.primaryColor,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              height: Dimensions.height * 0.06,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: OtpTextField(
                                  enabledBorderColor: Colora.scaffold,

                                  borderColor: const Color(0xFF512DA8),
                                  cursorColor: Colora.scaffold,
                                  textStyle: const TextStyle(
                                    color: Colora.scaffold,
                                  ),
                                  showFieldAsBox: false,
                                  //runs when a code is typed in

                                  //runs when every textfield is filled
                                  onSubmit: (String verificationCode) {
                                    code = verificationCode;
                                    context.read<LoginBloc>().add(
                                      VerifyOtp(
                                        phone: phoneNumber,
                                        otp: verificationCode,
                                      ),
                                    );
                                    /*  controller.verifayCode.value = val.toString();
                                        if (val != "") if (val.length > 3) {
                                          return verificationCode(val);
                                        } */
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colora.primaryColor,
                                ),
                              ),
                              onPressed: () {
                                if (code.isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: 'کد تایید را وارد کنید',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  context.read<LoginBloc>().add(
                                    VerifyOtp(phone: phoneNumber, otp: code),
                                  );
                                }
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return const VendorHomeScreen(title: 'dcd');
                                //   },
                                // ));
                              },
                              child:
                                  (state.status == LoginStatus.loading)
                                      ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                      : const Text(
                                        'ورود',
                                        style: TextStyle(color: Colors.white),
                                      ),
                            ),

                            const Spacer(),

                            CustomPaint(
                              painter: CCurvedPainter(),
                              child: Container(
                                // height: 84.3,
                                height: 100,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "copyright",
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "ASUD   2021",
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
