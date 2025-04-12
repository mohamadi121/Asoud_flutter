import 'package:asood/core/router/app_routers.dart';
import 'package:asood/features/bank_card/screens/bank_card_list.dart';
import 'package:asood/features/business_card/presentation/screens/create_business_card.dart';
import 'package:asood/features/create_workspace/presentation/screen/create_workspace.dart';
import 'package:asood/features/vendor/presentation/screen/stores_screen.dart';
import 'package:flutter/material.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/appbar/default_appbar.dart';
import 'package:asood/features/vendor/presentation/widgets/dashboard_carousel.dart';
import 'package:asood/features/vendor/presentation/widgets/item_box_with_title.dart';
import 'package:asood/features/vendor/presentation/widgets/simple_itembox.dart';
import 'package:go_router/go_router.dart';

Map dummyData = {
  "firstMenu": [
    {
      "title": "ایجاد دفتر کار",
      "image": Container(),
      "page": AppRoutes.createWorkSpace,
    },
    {"title": "کسب درآمد از آسود", "image": Container()},
    {
      "title": "کارت ویزیت",
      "image": Container(),
      "page": AppRoutes.createBusinessCard,
    },
    {
      "title": "استعلام بها",
      "image": Container(),
      "page": AppRoutes.storeScreen,
    },
    {"title": "ثبت آگهی", "image": Container()},
    {"title": "بازاریاب", "image": Container()},
  ],
  "secondMenu": [
    {
      "title": "امور مالی",
      "image": Container(),
      "page": AppRoutes.bankCardList,
    },
    {
      "title": "رهیابی خرید",
      "image": Container(),
      "page": AppRoutes.customerDashboard,
    },
    {
      "title": "رهیابی فروش",
      "image": Container(),
      "page": AppRoutes.vendorDashboard,
    },
    {
      "title": "اشتراک گذاری",
      "image": const Icon(Icons.share, size: 60, color: Colors.white),
      "page": AppRoutes.product,
    },
    {"title": "پیام کوتاه", "image": Container(), "page": AppRoutes.panelInbox},
    {"title": "علاقه مندی", "image": Container()},
    {"title": "راهنما", "image": Container()},
    {"title": "پشتیبانی", "image": Container()},
    //settings
    {
      "title": "تنظیمات",
      "image": Container(),
      // "page": const SettingsPageScreen(),
    },
  ],
};

class VendorHomeScreen extends StatelessWidget {
  const VendorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          // appBar: DefaultAppBar(context: context, title: 'home',),
          body: Stack(
            children: [
              //main items
              SizedBox(
                height: Dimensions.height,
                width: Dimensions.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Main column with carousel and grids
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          // margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.only(top: Dimensions.seven),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          // width: MediaQuery.of(context).size.width * 0.90,
                          child: Column(
                            children: [
                              //for appbar
                              SizedBox(height: Dimensions.height * 0.12),

                              // Dotted Carousel with 20% height
                              const DashboardCarouselWidget(),

                              // Grid with 25% height, 2 rows, and 3 columns
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.khorisontal,
                                ),
                                child: DashboardServicesWidget(),
                              ),

                              // Grid with 35% height, 3 rows, and 3 columns
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.khorisontal,
                                ),
                                child: DashboardAdditionalWidget(),
                              ),

                              SizedBox(height: Dimensions.height * 0.15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //appbar
              const NewAppBar(title: 'home'),
            ],
          ),
          bottomNavigationBar: Stack(
            children: [
              CustomPaint(
                size: Size(Dimensions.width, Dimensions.height * 0.15),
                // size: const Size(400, 90),
                painter: CurvedPainter(),
              ),
              Positioned(
                bottom: 0,
                width: Dimensions.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.height * 0.01,
                      ),
                      child: const Text(
                        'خانه',
                        style: TextStyle(
                          color: Colora.scaffold,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //     bottom: Dimensions.height * .029,
              //     left: Dimensions.width * .12,
              //     child: const Icon(
              //       Icons.tab,
              //       color: Colors.white,
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------

class DashboardAdditionalWidget extends StatelessWidget {
  const DashboardAdditionalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: Deco.kshadow,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: Dimensions.height * 0.46,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            //title
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  "امکانات:",
                  style: ATextStyle.lightBlue16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //items
            SizedBox(
              height: Dimensions.height * .45,
              width: Dimensions.width * .7,

              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                shrinkWrap: true,
                cacheExtent: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ...List.generate(
                    dummyData["secondMenu"].length,
                    (index) => FittedBox(
                      child: ItemBoxTitle(
                        onTap: () {
                          context.push(dummyData["secondMenu"][index]["page"]);
                        },
                        title: dummyData["secondMenu"][index]["title"],
                        child: dummyData["secondMenu"][index]["image"],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardServicesWidget extends StatelessWidget {
  const DashboardServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: Deco.kshadow,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: MediaQuery.of(context).size.height * 0.41,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            //title
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  "کسب وکار:",
                  style: ATextStyle.lightBlue16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: Dimensions.height * .4,
              width: Dimensions.width * .8,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                shrinkWrap: true,
                cacheExtent: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                children: [
                  ...List.generate(
                    dummyData["firstMenu"].length,
                    (index) => SimpleItemBox(
                      onTap: () {
                        context.push(dummyData["firstMenu"][index]["page"]);
                      },
                      title: dummyData["firstMenu"][index]["title"],
                      child: dummyData["firstMenu"][index]["image"],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
