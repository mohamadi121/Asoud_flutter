import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/helper/snack_bar_util.dart';
import 'package:asood/core/helper/validators.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/core/router/app_routers.dart';

import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_dialog.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:asood/core/widgets/map_widget_2.dart';
import 'package:asood/features/create_workspace/presentation/bloc/create_workspace_bloc.dart';
import 'package:asood/features/create_workspace/presentation/widgets/location_dialog.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class LocationInfo extends StatefulWidget {
  final CreateWorkSpaceBloc bloc;
  const LocationInfo({required this.bloc, super.key});

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  final _formKey = GlobalKey<FormState>();

  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();

  late CreateWorkSpaceBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CreateWorkSpaceBloc>(context);

    bloc.add(LoadCountry());
  }

  @override
  void dispose() {
    addressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.khorisontal),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Dimensions.width,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colora.primaryColor,
              ),
              child: BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //country
                        const SizedBox(height: 15),
                        CustomButton(
                          onPress: () {
                            widget.bloc.add(LoadCountry());

                            LocationDialog.showLocationSelector(
                              title: "کشور",
                              context: context,
                              items: bloc.state.countryList,
                              getName: (item) => item.name ?? '',
                              getId: (item) => item.id,
                              onLoad: () {
                                bloc.add(
                                  ChangeLocDataEvent(
                                    province: "",
                                    provinceId: "",
                                  ),
                                );
                              },
                              onSelect: (item) {
                                bloc.add(
                                  ChangeLocDataEvent(
                                    country: item.name!,
                                    countryId: item.id!,
                                  ),
                                );
                              },
                            );
                          },
                          width: Dimensions.width * 0.88,
                          height: Dimensions.height * 0.05,
                          color: Colors.white,
                          text: state.country.isEmpty ? "کشور" : state.country,
                          textColor: Colora.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),

                        //province
                        const SizedBox(height: 7),
                        CustomButton(
                          onPress: () {
                            if (state.countryId.isEmpty) {
                              showSnackBar(
                                context,
                                "لطفا ابتدا کشور را انتخاب کنید",
                              );
                            } else {
                              LocationDialog.showLocationSelector(
                                title: "استان",
                                context: context,
                                onLoad: () {
                                  bloc.add(
                                    ChangeLocDataEvent(
                                      province: "",
                                      provinceId: "",
                                    ),
                                  );
                                  widget.bloc.add(
                                    LoadProvince(countryId: state.countryId),
                                  );
                                },
                                items: bloc.state.provinceList,
                                getName: (item) => item.name ?? '',
                                getId: (item) => item.id,

                                onSelect: (item) {
                                  bloc.add(
                                    ChangeLocDataEvent(
                                      province: item.name!,
                                      provinceId: item.id!,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          width: Dimensions.width * 0.88,
                          height: Dimensions.height * 0.05,
                          color: Colors.white,
                          text:
                              state.province.isEmpty ? "استان" : state.province,
                          textColor: Colora.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),

                        //city
                        const SizedBox(height: 7),
                        CustomButton(
                          onPress: () {
                            if (state.provinceId.isEmpty) {
                              showSnackBar(
                                context,
                                "لطفا ابتدا استان را انتخاب کنید",
                              );
                            } else {
                              LocationDialog.showLocationSelector(
                                title: "شهر",
                                context: context,
                                onLoad: () {
                                  bloc.add(
                                    ChangeLocDataEvent(city: "", cityId: ""),
                                  );
                                  widget.bloc.add(
                                    LoadCity(provinceId: state.provinceId),
                                  );
                                },
                                items: bloc.state.cityList,
                                getName: (item) => item.name ?? '',
                                getId: (item) => item.id,
                                onSelect: (item) {
                                  bloc.add(
                                    ChangeLocDataEvent(
                                      city: item.name!,
                                      cityId: item.id!,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          width: Dimensions.width * 0.88,
                          height: Dimensions.height * 0.05,
                          color: Colors.white,
                          text: state.city.isEmpty ? "شهر" : state.city,
                          textColor: Colora.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 7),
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
                          maxLength: 10,
                          validator: Validators.post,
                        ),

                        //location picker
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 7,
                          ),
                          height: 220,

                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: MapScreen(
                                isSelecting: true,
                                selectedLocation: (mapLocation) {
                                  bloc.add(
                                    ChangeLocDataEvent(
                                      latitude: mapLocation.latitude.toString(),
                                      longitude:
                                          mapLocation.longitude.toString(),
                                    ),
                                  );
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
                                      ChangeWorkspaceTabView(activeTabIndex: 1),
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    if (state.cityId.isEmpty ||
                                        addressController.text.isEmpty) {
                                      showSnackBar(
                                        context,
                                        "لطفا فیلدها را پر کنید",
                                      );
                                    } else if (state.latitude.isEmpty ||
                                        state.longitude.isEmpty) {
                                      showSnackBar(
                                        context,
                                        "اوکیشن را انتخاب کنید",
                                      );
                                    } else {
                                      widget.bloc.add(
                                        SaveMarketLocationEvent(),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'میخواهید از درگاه آسود استفاده کنید یا درگاه شخصی؟',
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomButton(
                                                      onPress: () {
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                        CustomDialog(
                                                          context: context,
                                                          title:
                                                              "ثبت درگاه شخصی",
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
                                                                    text:
                                                                        "کد درگاه",
                                                                    hintStyle:
                                                                        const TextStyle(
                                                                          color:
                                                                              Colors.white,
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
                                                                      onPress:
                                                                          () {},
                                                                      text:
                                                                          "ثبت",
                                                                      width:
                                                                          120,
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
                                                                      onPress:
                                                                          () {},
                                                                      text:
                                                                          "انصراف",
                                                                      width:
                                                                          120,
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
                                                      color:
                                                          Colora.primaryColor,
                                                      textColor: Colors.white,
                                                    ),
                                                    CustomButton(
                                                      onPress: () {
                                                        Navigator.pop(context);

                                                        context.push(
                                                          Routes.store,
                                                        );

                                                        widget.bloc.add(
                                                          ChangeWorkspaceTabView(
                                                            activeTabIndex: 0,
                                                          ),
                                                        );
                                                      },
                                                      text: "بعدا",
                                                      width: 90,
                                                      color:
                                                          Colora.primaryColor,
                                                      textColor: Colors.white,
                                                    ),
                                                    CustomButton(
                                                      onPress: () {
                                                        CustomDialog(
                                                          height: 405.0,
                                                          context: context,
                                                          title:
                                                              "پرداخت حق اشتراک",
                                                          widget: Container(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      10,
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
                                                                        height:
                                                                            35,
                                                                        width:
                                                                            180,
                                                                        child: CustomTextField(
                                                                          color: Colora.primaryColor.withOpacity(
                                                                            0.5,
                                                                          ),
                                                                          controller:
                                                                              TextEditingController(),
                                                                          text:
                                                                              "کد تخفیف",
                                                                        ),
                                                                      ),
                                                                      CustomButton(
                                                                        height:
                                                                            35,
                                                                        width:
                                                                            100,
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
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            30,
                                                                      ),
                                                                  margin: const EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        8,
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
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                          0.2,
                                                                        ),
                                                                  ),
                                                                  child: const Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                        height:
                                                                            10,
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
                                                                      text:
                                                                          "پرداخت",
                                                                      width:
                                                                          120,
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
                                                                      onPress:
                                                                          () {},
                                                                      text:
                                                                          "انصراف",
                                                                      width:
                                                                          120,
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
                                                      color:
                                                          Colora.primaryColor,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
