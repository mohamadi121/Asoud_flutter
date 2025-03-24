// Temp File for new screen links
import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/default_appbar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                context.push(Routes.vendorDashboard);
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
                context.push(Routes.vendorProfile);
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
                context.push(Routes.customerDashboard);
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
                context.push(Routes.inquiryRequests);
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
                context.push(Routes.feeInquiry);
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
                context.push(Routes.ordersLists);
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

                context.push(Routes.submitFeeInquiry);
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

                context.push(Routes.inquiryDetails);
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

                context.push(Routes.inquiryResponse);
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

                context.push(Routes.ordersLists);
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

                context.push(Routes.panelInbox);
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

                context.push(Routes.panelConfig);
              },
              text: "تنظیمات",
            ),
          ],
        ),
      ],
    );
  }
}
