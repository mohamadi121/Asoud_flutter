import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:asood/features/bank_card/screens/bank_card_list.dart';
import 'package:asood/features/business_card/screens/create_business_card.dart';
import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
import 'package:asood/features/panel/screens/inbox.dart';
import 'package:asood/features/product/screens/product.dart';
import 'package:asood/features/vendor/presentation/screens/settings/settings_menu_screen.dart';
import 'package:asood/features/vendor/presentation/screens/stores.dart';
import 'package:asood/features/vendor/presentation/widget/item_box_with_title.dart';
import 'package:asood/features/vendor/presentation/widget/simple_itembox.dart';

import 'create_workspace.dart';
import 'dashboard.dart';

Map dummyData = {
  "firstMenu": [
    {
      "title": "ایجاد دفتر کار",
      "image": Container(),
      "page": const CreateWorkSpaceScreen(),
    },
    {"title": "کسب درآمد از آسود", "image": Container()},
    {
      "title": "کارت ویزیت",
      "image": Container(),
      "page": const CreateBusinessCard(),
    },
    {
      "title": "استعلام بها",
      "image": Container(),
      "page": const StoresScreen(),
    },
    {"title": "ثبت آگهی", "image": Container()},
    {"title": "بازاریاب", "image": Container()},
  ],
  "secondMenu": [
    {"title": "امور مالی", "image": Container(), "page": const BankCardList()},
    {
      "title": "رهیابی خرید",
      "image": Container(),
      "page": const CustomerDashboardScreen(),
    },
    {
      "title": "رهیابی فروش",
      "image": Container(),
      "page": const VendorDashboardScreen(),
    },
    {
      "title": "اشتراک گذاری",
      "image": const Icon(Icons.share, size: 60, color: Colors.white),
      "page": const ProductScreen(),
    },
    {
      "title": "پیام کوتاه",
      "image": Container(),
      "page": const PanelInboxScreen(),
    },
    {"title": "علاقه مندی", "image": Container()},
    {"title": "راهنما", "image": Container()},
    {"title": "پشتیبانی", "image": Container()},
    //settings
    {
      "title": "تنظیمات",
      "image": Container(),
      "page": const SettingsPageScreen(),
    },
  ],
};

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key, required this.title});

  static const routeName = "/home";
  final String title;

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  // int _bottomNavIndex = 0;

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
              Container(
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
            Container(
              height: Dimensions.height * .45,
              width: Dimensions.width * .7,
              // padding: EdgeInsets.only(top: Dimensions.height * 0.02),
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
                          // context.router.push(dummyData["secondMenu"][index]["page"]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      dummyData["secondMenu"][index]["page"],
                            ),
                          );
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
        /*  border: Border.all(
          color: Colors.black,
          width: 1.0,
        ), */
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

            Container(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    dummyData["firstMenu"][index]["page"],
                          ),
                        );
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

class DashboardCarouselWidget extends StatefulWidget {
  const DashboardCarouselWidget({super.key});

  @override
  State<DashboardCarouselWidget> createState() =>
      _DashboardCarouselWidgetState();
}

class _DashboardCarouselWidgetState extends State<DashboardCarouselWidget> {
  int currentSliderIndex = 0;
  int sliderLength = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentSliderIndex = index;
                });
              },
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              disableCenter: false,
              enlargeFactor: 2,
              pageSnapping: true,
              viewportFraction: .9,
              autoPlay: true,
            ),
            items: List.generate(
              sliderLength,
              (index) => Container(
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(width: 13.0, color: Colora.primaryColor),
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/tools-that-you-should-have.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          //indicator
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: sliderLength,
              itemBuilder:
                  (context, index) => Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == currentSliderIndex
                              ? Colora.primaryColor
                              : Colora.scaffold,
                      border: Border.all(color: Colora.primaryColor, width: 2),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
