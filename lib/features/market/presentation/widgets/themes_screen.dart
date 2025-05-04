import 'package:asood/features/market/presentation/blocs/add_product/add_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/helper/snack_bar_util.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/features/market/presentation/blocs/bloc/market_bloc.dart';
import 'package:asood/features/vendor/presentation/bloc/vendor/vendor_bloc.dart';

class MultiViewSliderScreen extends StatefulWidget {
  const MultiViewSliderScreen({super.key});

  @override
  State<MultiViewSliderScreen> createState() => _MultiViewSliderScreenState();
}

class _MultiViewSliderScreenState extends State<MultiViewSliderScreen> {
  late MarketBloc bloc;

  final PageController _pageController = PageController();

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
                        SizedBox(
                          height: Dimensions.height * 0.35,
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: Dimensions.width * 0.02
                          // ),
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (int page) {
                              bloc.add(ChangeTemplateEvent(template: page));
                            },
                            children: [
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 0,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 1,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 2,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 3,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 4,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 5,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 6,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 7,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 8,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 9,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 10,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 11,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 12,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 13,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 14,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 15,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 16,
                                isAdmin: false,
                              ),
                              buildProductGridView(
                                marketId: bloc.state.marketId,
                                templateIndex: 17,
                                isAdmin: false,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        buildDotList(styleState),

                        SizedBox(height: Dimensions.height * 0.01),

                        //save button
                        BlocBuilder<MarketBloc, MarketState>(
                          builder: (context, state) {
                            if (bloc.state.status == CWSStatus.success) {
                              showSnackBar(context, "قالب با موفقیت اضافه شد");
                            }
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: Dimensions.width * 0.3,
                                height: Dimensions.height * 0.05,
                                color: styleState.secondColor,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (state.status != CWSStatus.loading) {
                                      bloc.add(
                                        AddTemplateEvent(
                                          marketId: bloc.state.marketId,
                                          template: bloc.state.templateIndex,
                                        ),
                                      );
                                    }
                                  },
                                  child:
                                      state.status == CWSStatus.loading
                                          ? const Center(
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                          : Text(
                                            'ذخیره',
                                            style: TextStyle(
                                              color: styleState.fontColor,
                                              fontFamily: styleState.fontFamily,
                                              fontSize:
                                                  Dimensions.width * 0.037,
                                            ),
                                          ),
                                ),
                              ),
                            );
                            // return CustomButton(

                            //   onPress: () {
                            //
                            //   },
                            //   text:
                            //       state.status == CWSStatus.loading
                            //           ? null
                            //           : "ذخیره",
                            //   color: Colors.white,
                            //   textColor: Colora.primaryColor,
                            //   height: 40,
                            //   width: 100,
                            //   btnWidget:
                            //       state.status == CWSStatus.loading
                            //           ? const Center(
                            //             child: SizedBox(
                            //               height: 25,
                            //               width: 25,
                            //               child: CircularProgressIndicator(),
                            //             ),
                            //           )
                            //           : null,
                            // );
                          },
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
                        bloc.state.templateIndex == index
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

class ProductGridView extends StatelessWidget {
  final String marketId;
  final int templateIndex;
  final bool isAdmin;

  const ProductGridView({
    Key? key,
    required this.marketId,
    required this.templateIndex,
    this.isAdmin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width,
      height: Dimensions.height * 0.35,
      child: BlocBuilder<VendorBloc, VendorState>(
        builder: (context, styleState) {
          switch (templateIndex) {
            case 0:
              return _buildTemplate0(styleState);
            case 1:
              return _buildTemplate1(styleState);
            case 2:
              return _buildTemplate2(styleState);
            case 3:
              return _buildTemplate3(styleState);
            case 4:
              return _buildTemplate4(styleState);
            case 5:
              return _buildTemplate5(styleState);
            case 6:
              return _buildTemplate6(styleState);
            case 7:
              return _buildTemplate7(styleState);
            case 8:
              return _buildTemplate8(styleState);
            case 9:
              return _buildTemplate9(styleState);
            case 10:
              return _buildTemplate10(styleState);
            case 11:
              return _buildTemplate11(styleState);
            case 12:
              return _buildTemplate12(styleState);
            case 13:
              return _buildTemplate13(styleState);
            case 14:
              return _buildTemplate14(styleState);
            case 15:
              return _buildTemplate15(styleState);
            case 16:
              return _buildTemplate16(styleState);
            case 17:
              return _buildTemplate17(styleState);

            default:
              return _buildTemplate1(styleState);
          }
        },
      ),
    );
  }

  Widget _buildProductCard({
    required BuildContext context,
    required double width,
    required double height,
    required double imageHeight,
    required double fontSize,
    required double priceFontSize,
    required VendorState styleState,
  }) {
    return Container(
      width: width,
      height: height,
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
          if (isAdmin) {
            context.read<AddProductBloc>().add(ResetDataEvent());
            context.push(AppRoutes.createProduct, extra: marketId);
          } else {
            // context.push(AppRoutes.createProduct, extra: marketId);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: imageHeight,
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
                  fontSize: fontSize,
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
                  fontSize: priceFontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowProductCard({
    required BuildContext context,
    required double width,
    required double height,
    required double imageHeight,
    required double imageWidth,
    required double fontSize,
    required double priceFontSize,
    required VendorState styleState,
    required bool leftAligned,
  }) {
    return Container(
      width: width,
      height: height,
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
      child: Directionality(
        textDirection: leftAligned ? TextDirection.rtl : TextDirection.ltr,
        child: InkWell(
          onTap: () {
            if (isAdmin) {
              context.read<AddProductBloc>().add(ResetDataEvent());
              context.push(AppRoutes.createProduct, extra: marketId);
            } else {
              context.push(AppRoutes.createProduct, extra: marketId);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
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
              Column(
                children: [
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
                        fontSize: fontSize,
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
                        fontSize: priceFontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemplate1(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.4,
                height: Dimensions.height * 0.35,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate0(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.4,
                height: Dimensions.height * 0.35,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate2(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.55,
                height: Dimensions.height,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate3(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.55,
                height: Dimensions.height,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate4(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.40,
                height: Dimensions.height,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate5(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.40,
                height: Dimensions.height,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                    Expanded(
                      child: _buildProductCard(
                        context: context,
                        width: double.infinity,
                        height: double.infinity,
                        imageHeight: Dimensions.height * 0.115,
                        fontSize: Dimensions.width * 0.02,
                        priceFontSize: Dimensions.width * 0.017,
                        styleState: styleState,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate6(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate7(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                flex: 1,
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate8(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate9(VendorState styleState) {
    return Builder(
      builder:
          (context) => Column(
            children: [
              SizedBox(
                height: Dimensions.height * 0.175,
                child: _buildRowProductCard(
                  context: context,
                  width: double.infinity,
                  height: Dimensions.height * 0.175,
                  imageHeight: Dimensions.height * 0.175,
                  imageWidth: Dimensions.width * 0.4,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                  leftAligned: true,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate10(VendorState styleState) {
    return Builder(
      builder:
          (context) => Column(
            children: [
              SizedBox(
                height: Dimensions.height * 0.175,
                child: _buildRowProductCard(
                  context: context,
                  width: double.infinity,
                  height: Dimensions.height * 0.175,
                  imageHeight: Dimensions.height * 0.175,
                  imageWidth: Dimensions.width * 0.4,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                  leftAligned: false,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate11(VendorState styleState) {
    return Builder(
      builder:
          (context) => Column(
            children: [
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate12(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate13(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.35 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.35 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.35 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate14(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.25 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.25 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: Dimensions.height * 0.25 * 0.75,
                  child: _buildProductCard(
                    context: context,
                    width: double.infinity,
                    height: double.infinity,
                    imageHeight: Dimensions.height * 0.275,
                    fontSize: Dimensions.width * 0.025,
                    priceFontSize: Dimensions.width * 0.017,
                    styleState: styleState,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate15(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: Dimensions.width * 0.4,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.55,
                height: double.infinity,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate16(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              _buildProductCard(
                context: context,
                width: Dimensions.width * 0.55,
                height: double.infinity,
                imageHeight: Dimensions.height * 0.275,
                fontSize: Dimensions.width * 0.025,
                priceFontSize: Dimensions.width * 0.017,
                styleState: styleState,
              ),
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: Dimensions.width * 0.4,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTemplate17(VendorState styleState) {
    return Builder(
      builder:
          (context) => Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
              Expanded(
                child: _buildProductCard(
                  context: context,
                  width: double.infinity,
                  height: double.infinity,
                  imageHeight: Dimensions.height * 0.275,
                  fontSize: Dimensions.width * 0.025,
                  priceFontSize: Dimensions.width * 0.017,
                  styleState: styleState,
                ),
              ),
            ],
          ),
    );
  }
}

Widget buildProductGridView({
  required String marketId,
  required int templateIndex,
  bool isAdmin = false,
}) {
  return ProductGridView(
    marketId: marketId,
    templateIndex: templateIndex,
    isAdmin: isAdmin,
  );
}
