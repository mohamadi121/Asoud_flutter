import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/core/utils/secure_storage.dart';
import 'package:asood/core/utils/snack_bar_util.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_dialog.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:asood/core/widgets/map_widget_2.dart';
import 'package:asood/features/vendor/presentation/blocs/create_workspace/create_workspace_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class LocationInfo extends StatefulWidget {
  final CreateWorkSpaceBloc bloc;
  const LocationInfo({required this.bloc, super.key});

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  bool switchValue = false;

  String countryName = 'کشور';
  int countryId = 0;

  String provinceName = 'استان';
  int provinceId = 0;

  String cityName = 'شهر';
  int cityId = 0;

  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();

  late CreateWorkSpaceBloc bloc;

  late LatLng location = const LatLng(0, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<CreateWorkSpaceBloc>(context);
    // Dispatch the event when the screen is opened
    bloc.add(LoadCountry());
  }

  @override
  void dispose() {
    addressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void country() {
    setState(() {
      provinceName = 'استان';
      provinceId = 0;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "کشور",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colora.scaffold,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.width * 0.03,
          ),
          backgroundColor: Colora.primaryColor,
          content: BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
            builder: (context, state) {
              if (state.status == CWSStatus.success) {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.01,
                    horizontal: Dimensions.width * 0.0,
                  ),
                  child: ListView.builder(
                    itemCount: state.countryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colora.scaffold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              countryName = state.countryList[index].name!;
                            });

                            countryId = state.countryList[index].id!;
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            state.countryList[index].name.toString(),
                            style: const TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state.status == CWSStatus.loading) {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colora.scaffold),
                  ),
                );
              } else {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: Text(
                      'خطا در برقراری اطلاعات',
                      style: TextStyle(color: Colora.scaffold),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  void province() {
    setState(() {
      cityName = 'شهر';
      cityId = 0;
    });

    bloc.add(LoadProvince(countryId: countryId));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "استان",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colora.scaffold,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.width * 0.03,
          ),
          backgroundColor: Colora.primaryColor,
          content: BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
            builder: (context, state) {
              if (state.status == CWSStatus.success) {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.01,
                    horizontal: Dimensions.width * 0.0,
                  ),
                  child: ListView.builder(
                    itemCount: state.provinceList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colora.scaffold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              provinceName = state.provinceList[index].name!;
                            });

                            provinceId = state.provinceList[index].id!;
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            state.provinceList[index].name.toString(),
                            style: const TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state.status == CWSStatus.loading) {
                return SizedBox(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colora.scaffold),
                  ),
                );
              } else {
                return SizedBox(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: Text(
                      'خطا در برقراری اطلاعات',
                      style: TextStyle(color: Colora.scaffold),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  void city() {
    bloc.add(LoadCity(provinceId: provinceId));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "شهر",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colora.scaffold,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.width * 0.03,
          ),
          backgroundColor: Colora.primaryColor,
          content: BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
            builder: (context, state) {
              if (state.status == CWSStatus.success) {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.01,
                    horizontal: Dimensions.width * 0.0,
                  ),
                  child: ListView.builder(
                    itemCount: state.cityList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: Colora.scaffold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              cityName = state.cityList[index].name!;
                            });

                            cityId = state.cityList[index].id!;
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            state.cityList[index].name.toString(),
                            style: const TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state.status == CWSStatus.loading) {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colora.scaffold),
                  ),
                );
              } else {
                return Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.5,
                  child: const Center(
                    child: Text(
                      'خطا در برقراری اطلاعات',
                      style: TextStyle(color: Colora.scaffold),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.khorisontal),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //image
            Container(
              height: Dimensions.height * 0.25,
              width: Dimensions.width,
              padding: EdgeInsets.only(bottom: Dimensions.height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colora.primaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/tools-that-you-should-have.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: Dimensions.width,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colora.primaryColor,
              ),
              child: Column(
                children: [
                  //country
                  const SizedBox(height: 15),
                  CustomButton(
                    onPress: () => country(),
                    width: Dimensions.width * 0.88,
                    height: Dimensions.height * 0.05,
                    color: Colors.white,
                    text: countryName,
                    textColor: Colora.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),

                  //province
                  const SizedBox(height: 2),
                  CustomButton(
                    onPress: () {
                      if (countryId == 0) {
                        showSnackBar(context, "لطفا ابتدا کشور را انتخاب کنید");
                      } else {
                        province();
                      }
                    },
                    width: Dimensions.width * 0.88,
                    height: Dimensions.height * 0.05,
                    color: Colors.white,
                    text: provinceName,
                    textColor: Colora.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),

                  //city
                  const SizedBox(height: 2),
                  CustomButton(
                    onPress: () {
                      if (provinceId == 0) {
                        showSnackBar(
                          context,
                          "لطفا ابتدا استان را انتخاب کنید",
                        );
                      } else {
                        city();
                      }
                    },
                    width: Dimensions.width * 0.88,
                    height: Dimensions.height * 0.05,
                    color: Colors.white,
                    text: cityName,
                    textColor: Colora.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),

                  // address
                  CustomTextField(
                    maxLine: 6,
                    controller: addressController,
                    text: "آدرس فروشگاه",
                  ),
                  const SizedBox(height: 7),

                  //zipcode
                  CustomTextField(
                    controller: zipCodeController,
                    text: "کد پستی",
                  ),

                  //location picker
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 7,
                    ),
                    height: 220,
                    /*     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: Colors.white), */
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MapScreen(
                          isSelecting: true,
                          selectedLocation: (mapLocation) {
                            setState(() {
                              location = mapLocation;
                            });
                          },
                        ),
                      ),
                      // LocationPicker(),
                    ),
                  ),
                  const SizedBox(height: 7),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //back
                          CustomButton(
                            width: 100,
                            onPress: () {
                              widget.bloc.add(
                                const ChangeTabView(activeTabIndex: 1),
                              );
                            },
                            text: "قبلی",
                            color: Colors.white,
                            textColor: Colora.primaryColor,
                            height: 40,
                          ),
                          const SizedBox(width: 5),

                          //submit
                          CustomButton(
                            width: 100,
                            onPress: () async {
                              FocusManager.instance.primaryFocus?.unfocus();

                              if (cityId == 0 ||
                                  addressController.text.isEmpty) {
                                showSnackBar(
                                  context,
                                  "لطفا شهر و آدرس را پر کنید",
                                );
                              } else {
                                String marketId = await SecureStorage()
                                    .readSecureStorage('market_id');
                                widget.bloc.add(
                                  MarketLocation(
                                    marketId: int.parse(marketId),
                                    city: cityId,
                                    workAddress: addressController.text,
                                    postalCode: zipCodeController.text,
                                    longitude: location.latitude
                                        .toString()
                                        .substring(0, 8),
                                    latitude: location.longitude
                                        .toString()
                                        .substring(0, 8),
                                  ),
                                );

                                if (widget.bloc.state.status ==
                                    CWSStatus.success) {
                                  CustomDialog(
                                    context: context,
                                    title: "انتخاب درگاه",
                                    widget: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'میخواهید از درگاه آسود استفاده کنید یا درگاه شخصی؟',
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                onPress: () {
                                                  Navigator.of(context).pop();
                                                  CustomDialog(
                                                    context: context,
                                                    title: "ثبت درگاه شخصی",
                                                    widget: Container(
                                                      height: 130,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'کلید درگاه خود را وارد کنید',
                                                          ),
                                                          SizedBox(
                                                            height: 35,
                                                            child: CustomTextField(
                                                              controller:
                                                                  TextEditingController(),
                                                              text: "کد درگاه",
                                                              hintStyle:
                                                                  const TextStyle(
                                                                    color:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                              color:
                                                                  Colora
                                                                      .primaryColor,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomButton(
                                                                onPress: () {},
                                                                text: "ثبت",
                                                                width: 120,
                                                                color:
                                                                    Colora
                                                                        .primaryColor,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              CustomButton(
                                                                onPress: () {},
                                                                text: "انصراف",
                                                                width: 120,
                                                                color:
                                                                    Colora
                                                                        .primaryColor,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).showCustomDialog();
                                                },
                                                text: "درگاه شخصی",
                                                width: 90,
                                                color: Colora.primaryColor,
                                                textColor: Colors.white,
                                              ),
                                              CustomButton(
                                                onPress: () {
                                                  Navigator.pop(context);

                                                  context.push(Routes.store);

                                                  widget.bloc.add(
                                                    const ChangeTabView(
                                                      activeTabIndex: 0,
                                                    ),
                                                  );
                                                  SecureStorage()
                                                      .deleteSecureStorage(
                                                        'market_id',
                                                      );
                                                  SecureStorage()
                                                      .deleteSecureStorage(
                                                        'marketActiveTabIndex',
                                                      );
                                                },
                                                text: "بعدا",
                                                width: 90,
                                                color: Colora.primaryColor,
                                                textColor: Colors.white,
                                              ),
                                              CustomButton(
                                                onPress: () {
                                                  CustomDialog(
                                                    height: 405.0,
                                                    context: context,
                                                    title: "پرداخت حق اشتراک",
                                                    widget: Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10,
                                                          ),
                                                      child: Column(
                                                        children: [
                                                          const Text(
                                                            "مبلغ پرداختی را وارد کنید",
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 180,
                                                                  child: CustomTextField(
                                                                    color: Colora
                                                                        .primaryColor
                                                                        .withOpacity(
                                                                          0.5,
                                                                        ),
                                                                    controller:
                                                                        TextEditingController(),
                                                                    text:
                                                                        "کد تخفیف",
                                                                  ),
                                                                ),
                                                                CustomButton(
                                                                  height: 35,
                                                                  width: 100,
                                                                  onPress:
                                                                      () {},
                                                                  text:
                                                                      "ثبت تخفیف",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      30,
                                                                ),
                                                            margin:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 8,
                                                                ),
                                                            height: 200,
                                                            width:
                                                                Dimensions
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    20,
                                                                  ),
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                    0.2,
                                                                  ),
                                                            ),
                                                            child: const Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "مبلغ پرداختی:",
                                                                    ),
                                                                    Text(
                                                                      "تومان",
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "مبلغ پرداختی:",
                                                                    ),
                                                                    Text(
                                                                      "تومان",
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "مبلغ پرداختی:",
                                                                    ),
                                                                    Text(
                                                                      "تومان",
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "مبلغ پرداختی:",
                                                                    ),
                                                                    Text(
                                                                      "تومان",
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "مبلغ پرداختی:",
                                                                    ),
                                                                    Text(
                                                                      "تومان",
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomButton(
                                                                onPress: () {
                                                                  context.push(
                                                                    Routes
                                                                        .store,
                                                                  );
                                                                  /*        Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const StoresScreen())); */
                                                                },
                                                                text: "پرداخت",
                                                                width: 120,
                                                                color:
                                                                    Colora
                                                                        .primaryColor,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              CustomButton(
                                                                onPress: () {},
                                                                text: "انصراف",
                                                                width: 120,
                                                                color:
                                                                    Colora
                                                                        .primaryColor,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).showCustomDialog();
                                                },
                                                text: "درگاه آسود",
                                                width: 90,
                                                color: Colora.primaryColor,
                                                textColor: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).showCustomDialog();
                                }
                              }
                            },
                            text: "ثبت",
                            color: Colors.white,
                            textColor: Colora.primaryColor,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
