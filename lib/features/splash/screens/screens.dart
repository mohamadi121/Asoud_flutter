// Temp File for new screen links
import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_router.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreensListScreen extends StatelessWidget {
  const ScreensListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context: context, title: 'لیست صفحات'),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: Dimensions.width,
          child: ListView(
            children: const [
              Column(
                children: [
                  VendorScreens(),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  CustomerScreens(),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  InquiryScreens(),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  OrderScreens(),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                  PanelScreens(),
                  SizedBox(height: 20),
                  Divider(thickness: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VendorScreens extends StatelessWidget {
  const VendorScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("فروشنده"),
        const SizedBox(height: 10),
        Column(
          children: [
            CustomButton(
              onPress: () {
                context.router.push(const VendorDashboardRoute());
                /*        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VendorDashboardScreen(),
                ),
              ); */
              },
              text: "داشبورد فروشنده",
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                context.router.push(const VendorProfileRoute());
                /*   Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VendorProfileScreen(),
                ),
              ); */
              },
              text: "پروفایل",
            ),
          ],
        ),
      ],
    );
  }
}

class CustomerScreens extends StatelessWidget {
  const CustomerScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("مشتریان"),
        const SizedBox(height: 10),
        Column(
          children: [
            CustomButton(
              onPress: () {
                /*    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerDashboardScreen(),
                ),
              ); */
                context.router.push(const CustomerDashboardRoute());
              },
              text: "داشبورد خریدار",
            ),
          ],
        ),
      ],
    );
  }
}

class InquiryScreens extends StatelessWidget {
  const InquiryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("استعلام"), // inquiry section
        const SizedBox(height: 10),
        Column(
          children: [
            CustomButton(
              onPress: () {
                /*       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InquiryRequestsScreen(),
                  ),
                ); */
                context.router.push(const InquiryRequestsRoute());
              },
              text: "لیست استعلام",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /*    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeeInquiryScreen(),
                  ),
                ); */
                context.router.push(const FeeInquiryRoute());
              },
              text: "استعلام بها",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /*     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersListScreen(),
                  ),
                ); */
                context.router.push(const OrdersListRoute());
              },
              text: "لیست سفارشات",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubmitFeeInquiryScreen(),
                  ),
                ); */
                context.router.push(const SubmitFeeInquiryRoute());
              },
              text: "ثبت استعلام بها",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InquiryDetailsScreen(),
                  ),
                ); */
                context.router.push(const InquiryDetailsRoute());
              },
              text: "صورت استعلام",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InquiryResponseScreen(),
                  ),
                ); */
                context.router.push(const InquiryResponseRoute());
              },
              text: "پاسخ به استعلام بها",
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class OrderScreens extends StatelessWidget {
  const OrderScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("سفارشات"),
        const SizedBox(height: 10),
        Column(
          children: [
            CustomButton(
              onPress: () {
                /*     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersListScreen(),
                  ),
                ); */
                context.router.push(const OrdersListRoute());
              },
              text: "لیست سفارشات",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

class PanelScreens extends StatelessWidget {
  const PanelScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("پنل پیام"),
        const SizedBox(height: 10),
        Column(
          children: [
            CustomButton(
              onPress: () {
                /*       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PanelInboxScreen(),
                  ),
                ); */
                context.router.push(const PanelInboxRoute());
              },
              text: "صندوق پیام",
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPress: () {
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PanelConfigScreen(),
                    )); */
                context.router.push(const PanelConfigRoute());
              },
              text: "تنظیمات",
            ),
          ],
        ),
      ],
    );
  }
}
