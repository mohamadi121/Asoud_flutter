import 'package:asood/core/constants/constants.dart';
import 'package:asood/features/market/presentation/blocs/bloc/market_bloc.dart';
import 'package:asood/features/market/presentation/screens/add_product.dart';
import 'package:asood/features/vendor/presentation/blocs/vendor/vendor_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MultiViewSliderScreen extends StatefulWidget {
  const MultiViewSliderScreen({super.key});

  @override
  State<MultiViewSliderScreen> createState() => _MultiViewSliderScreenState();
}

class _MultiViewSliderScreenState extends State<MultiViewSliderScreen> {
  late MarketBloc bloc;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<MarketBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // bottomNavigationBar: const SimpleBotNavBar(),
          body: Stack(
            children: [
              BlocBuilder<VendorBloc, VendorState>(
                builder:
                    (context, styleState) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: Dimensions.height * 0.1,
                        // ),
                        Container(
                          height: Dimensions.height * 0.35,
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: Dimensions.width * 0.02
                          // ),
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: [
                              buildProductGridView0(),
                              buildProductGridView1(),
                              buildProductGridView2(),
                              buildProductGridView3(),
                              buildProductGridView4(),
                              buildProductGridView5(),
                              buildProductGridView6(),
                              buildProductGridView7(),
                              buildProductGridView8(),
                              buildProductGridView9(),
                              buildProductGridView10(),
                              buildProductGridView11(),
                              buildProductGridView12(),
                              buildProductGridView13(),
                              buildProductGridView14(),
                              buildProductGridView15(),
                              buildProductGridView16(),
                              buildProductGridView17(),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        buildDotList(styleState),

                        SizedBox(height: Dimensions.height * 0.01),

                        //save button
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: Dimensions.width * 0.3,
                            height: Dimensions.height * 0.05,
                            color: styleState?.secondColor,
                            child: MaterialButton(
                              onPressed: () {
                                bloc.add(
                                  AddTemplateEvent(template: _currentPage),
                                );
                                bloc.add(
                                  const ShowTemplatesEvent(isShow: false),
                                );
                                // showSnackBar(context, "قالب با موفقیت اضافه شد");
                              },
                              child: Text(
                                'ذخیره',
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.037,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),

              // const NewAppBar(title: 'قالب ها',),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDotList(styleState) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 18,
        shrinkWrap: true,
        itemBuilder:
            (context, index) => SizedBox(
              width: Dimensions.width * 0.05,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: styleState.secondColor, width: 2),
                    color:
                        _currentPage == index
                            ? styleState.secondColor
                            : Colora.scaffold,
                  ),
                ),
              ),
            ),
      ),
    );

    //   Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: List<Widget>.generate(18, (index) {
    //     return Container(
    //       width: 10,
    //       height: 10,
    //       margin: const EdgeInsets.symmetric(horizontal: 5),
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         border: Border.all(
    //           color: styleState.secondColor,
    //           width: 2
    //         ),
    //         color: _currentPage == index ? styleState.secondColor : Colora.scaffold,
    //       ),
    //     );
    //   }),
    // );
  }
}

Widget buildProductGridView0({isSelected = false, int marketId = 0}) {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            if (isSelected == true) {
                              print('2');
                            }
                          },

                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: Dimensions.height * 0.115,
                                  color: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/images/logo_svg.svg',
                                    colorFilter: ColorFilter.mode(
                                      styleState.secondColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width * 0.01,
                                  vertical: Dimensions.height * 0.005,
                                ),
                                child: Text(
                                  'عنوان محصول',
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: styleState.fontColor,
                                    fontFamily: styleState.fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.width * 0.02,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width * 0.01,
                                  vertical: Dimensions.height * 0.003,
                                ),
                                child: Text(
                                  '120.000 تومان',
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: styleState.fontColor,
                                    fontFamily: styleState.fontFamily,
                                    fontSize: Dimensions.width * 0.017,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            if (isSelected == true) {
                              print('3');
                            }
                          },

                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: Dimensions.height * 0.115,
                                  color: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/images/logo_svg.svg',
                                    colorFilter: ColorFilter.mode(
                                      styleState.secondColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width * 0.01,
                                  vertical: Dimensions.height * 0.005,
                                ),
                                child: Text(
                                  'عنوان محصول',
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: styleState.fontColor,
                                    fontFamily: styleState.fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.width * 0.02,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width * 0.01,
                                  vertical: Dimensions.height * 0.003,
                                ),
                                child: Text(
                                  '120.000 تومان',
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: styleState.fontColor,
                                    fontFamily: styleState.fontFamily,
                                    fontSize: Dimensions.width * 0.017,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: Dimensions.width * 0.4,
                height: Dimensions.height * 0.35,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    if (isSelected == true) {
                      // print('1');
                      print(marketId);

                      // context.router.push(const TakhfifRoute());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProduct(marketId: marketId),
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Container(
                              height: Dimensions.height * 0.275,
                              color: Colors.white,
                              child: SvgPicture.asset(
                                'assets/images/logo_svg.svg',
                                colorFilter: ColorFilter.mode(
                                  styleState.secondColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: Dimensions.height * 0.01,
                            //   left: Dimensions.width * 0.2,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: Colora.lightBlue,
                            //       shape: BoxShape.circle
                            //     ),
                            //     child: Icon(
                            //       Icons.add_shopping_cart_rounded
                            //     ),
                            //   )
                            // ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.007,
                        ),
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.005,
                        ),
                        child: Text(
                          '120.000 تومان',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontSize: Dimensions.width * 0.017,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    ),
  );
}

Widget buildProductGridView1() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Container(
                width: Dimensions.width * 0.4,
                height: Dimensions.height * 0.35,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Container(
                            height: Dimensions.height * 0.275,
                            color: Colors.white,
                            child: SvgPicture.asset(
                              'assets/images/logo_svg.svg',
                              colorFilter: ColorFilter.mode(
                                styleState.secondColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: Dimensions.height * 0.01,
                          //   left: Dimensions.width * 0.2,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: Colora.lightBlue,
                          //       shape: BoxShape.circle
                          //     ),
                          //     child: Icon(
                          //       Icons.add_shopping_cart_rounded
                          //     ),
                          //   )
                          // ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
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

Widget buildProductGridView2() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: Dimensions.width * 0.45,
                height: Dimensions.height,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.275,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView3() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Container(
                width: Dimensions.width * 0.45,
                height: Dimensions.height,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.275,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
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

Widget buildProductGridView4() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: Dimensions.width * 0.5,
                // height: Dimensions.height,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.275,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView5() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            children: [
              Container(
                width: Dimensions.width * 0.5,
                // height: Dimensions.height,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.275,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: Dimensions.height * 0.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: styleState.secondColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: Dimensions.height * 0.115,
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  'assets/images/logo_svg.svg',
                                  colorFilter: ColorFilter.mode(
                                    styleState.secondColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.005,
                              ),
                              child: Text(
                                'عنوان محصول',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.width * 0.02,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width * 0.01,
                                vertical: Dimensions.height * 0.003,
                              ),
                              child: Text(
                                '120.000 تومان',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: styleState.fontColor,
                                  fontFamily: styleState.fontFamily,
                                  fontSize: Dimensions.width * 0.017,
                                ),
                              ),
                            ),
                          ],
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

Widget buildProductGridView6() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.35,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Container(
            width: Dimensions.width * 0.94,
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width * 0.01,
              vertical: Dimensions.height * 0.008,
            ),
            decoration: BoxDecoration(
              color: styleState.secondColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: Dimensions.height * 0.28,
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'assets/images/logo_svg.svg',
                      colorFilter: ColorFilter.mode(
                        styleState.secondColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.05,
                    vertical: Dimensions.height * 0.017,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Dimensions.width * 0.69,
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: Dimensions.width * 0.15,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: Dimensions.width * 0.017,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ),
  );
}

Widget buildProductGridView7() {
  return BlocBuilder<VendorBloc, VendorState>(
    builder:
        (context, styleState) => Row(
          children: [
            Container(
              width: Dimensions.width * 0.94,
              height: Dimensions.height * 0.13,

              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.05,
                      vertical: Dimensions.height * 0.017,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimensions.width * 0.54,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.width * 0.028,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: Dimensions.width * 0.017,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.15,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}

Widget buildProductGridView8() {
  return BlocBuilder<VendorBloc, VendorState>(
    builder:
        (context, styleState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Dimensions.width * 0.94,
              height: Dimensions.height * 0.13,

              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.15,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.05,
                      vertical: Dimensions.height * 0.017,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimensions.width * 0.54,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.width * 0.028,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: Dimensions.width * 0.017,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}

Widget buildProductGridView9() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.25,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: Dimensions.height * 0.23,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.01,
                    vertical: Dimensions.height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: styleState.secondColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: Dimensions.height * 0.175,
                          color: Colors.white,
                          child: SvgPicture.asset(
                            'assets/images/logo_svg.svg',
                            colorFilter: ColorFilter.mode(
                              styleState.secondColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.007,
                        ),
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.005,
                        ),
                        child: Text(
                          '120.000 تومان',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontSize: Dimensions.width * 0.017,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: Dimensions.width * 0.55,
                height: Dimensions.height * 0.23,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.175,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView10() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.25,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width * 0.55,
                height: Dimensions.height * 0.23,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.175,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  height: Dimensions.height * 0.23,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.01,
                    vertical: Dimensions.height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: styleState.secondColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: Dimensions.height * 0.175,
                          color: Colors.white,
                          child: SvgPicture.asset(
                            'assets/images/logo_svg.svg',
                            colorFilter: ColorFilter.mode(
                              styleState.secondColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.007,
                        ),
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.005,
                        ),
                        child: Text(
                          '120.000 تومان',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontSize: Dimensions.width * 0.017,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    ),
  );
}

Widget buildProductGridView11() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.25,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width * 0.46,
                height: Dimensions.height * 0.23,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.175,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: Dimensions.width * 0.46,
                height: Dimensions.height * 0.23,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.175,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView12() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.21,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width * 0.46,
                height: Dimensions.height * 0.19,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.135,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: Dimensions.width * 0.46,
                height: Dimensions.height * 0.19,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.135,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView13() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.21,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: Dimensions.height * 0.19,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.01,
                    vertical: Dimensions.height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: styleState.secondColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: Dimensions.height * 0.135,
                          color: Colors.white,
                          child: SvgPicture.asset(
                            'assets/images/logo_svg.svg',
                            colorFilter: ColorFilter.mode(
                              styleState.secondColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.007,
                        ),
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.005,
                        ),
                        child: Text(
                          '120.000 تومان',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontSize: Dimensions.width * 0.017,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: Dimensions.width * 0.55,
                height: Dimensions.height * 0.19,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.135,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
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

Widget buildProductGridView14() {
  return SizedBox(
    width: Dimensions.width,
    height: Dimensions.height * 0.21,
    child: BlocBuilder<VendorBloc, VendorState>(
      builder:
          (context, styleState) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width * 0.55,
                height: Dimensions.height * 0.19,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.01,
                  vertical: Dimensions.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: styleState.secondColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Dimensions.height * 0.135,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.007,
                      ),
                      child: Text(
                        'عنوان محصول',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.width * 0.025,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                        vertical: Dimensions.height * 0.005,
                      ),
                      child: Text(
                        '120.000 تومان',
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: styleState.fontColor,
                          fontFamily: styleState.fontFamily,
                          fontSize: Dimensions.width * 0.017,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  height: Dimensions.height * 0.19,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.01,
                    vertical: Dimensions.height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: styleState.secondColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: Dimensions.height * 0.135,
                          color: Colors.white,
                          child: SvgPicture.asset(
                            'assets/images/logo_svg.svg',
                            colorFilter: ColorFilter.mode(
                              styleState.secondColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.007,
                        ),
                        child: Text(
                          'عنوان محصول',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.width * 0.025,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width * 0.01,
                          vertical: Dimensions.height * 0.005,
                        ),
                        child: Text(
                          '120.000 تومان',
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: styleState.fontColor,
                            fontFamily: styleState.fontFamily,
                            fontSize: Dimensions.width * 0.017,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    ),
  );
}

Widget buildProductGridView15() {
  return BlocBuilder<VendorBloc, VendorState>(
    builder:
        (context, styleState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.12,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.09,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 7,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.12,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.09,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 7,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.12,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.09,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 7,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}

Widget buildProductGridView16() {
  return BlocBuilder<VendorBloc, VendorState>(
    builder:
        (context, styleState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.2,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.16,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.2,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.16,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.2,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.16,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}

Widget buildProductGridView17() {
  return BlocBuilder<VendorBloc, VendorState>(
    builder:
        (context, styleState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.25,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.21,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.25,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.21,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Dimensions.width * 0.3,
              height: Dimensions.height * 0.25,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width * 0.01,
                vertical: Dimensions.height * 0.008,
              ),
              decoration: BoxDecoration(
                color: styleState.secondColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Dimensions.height * 0.21,
                      width: Dimensions.width * 0.3,
                      color: Colors.white,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(
                          'assets/images/logo_svg.svg',
                          colorFilter: ColorFilter.mode(
                            styleState.secondColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: Dimensions.width * 0.3,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.001,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عنوان محصول',
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.003,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '120.000 تومان',
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle(
                              color: styleState.fontColor,
                              fontFamily: styleState.fontFamily,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}
