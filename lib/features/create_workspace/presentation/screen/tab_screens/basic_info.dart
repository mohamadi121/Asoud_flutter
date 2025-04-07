import 'package:asood/core/helper/secure_storage.dart';
import 'package:asood/core/helper/snack_bar_util.dart';
import 'package:asood/core/helper/validators.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/features/create_workspace/presentation/bloc/create_workspace_bloc.dart';
import 'package:asood/features/create_workspace/presentation/widgets/simple_title.dart';
import 'package:asood/features/job_managment/presentation/bloc/jobmanagment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';

import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:asood/core/widgets/radio_button.dart';
import 'package:go_router/go_router.dart';

class BasicInfo extends StatefulWidget {
  final CreateWorkSpaceBloc bloc;
  const BasicInfo({required this.bloc, super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final _formKey = GlobalKey<FormState>();
  String selectedValue = '';
  final TextEditingController name = TextEditingController();
  final TextEditingController businessId = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController slogan = TextEditingController();
  final TextEditingController idCode = TextEditingController();

  String selectedCategoryId = "0";

  bool isInProcess = false;

  late CreateWorkSpaceBloc catBloc;

  @override
  void initState() {
    super.initState();
    // name.text = widget.bloc.state.name;
    // businessId.text = widget.bloc.state.businessId;
    // description.text = widget.bloc.state.description;
    // slogan.text = widget.bloc.state.slogan;
    // selectedValue = widget.bloc.state.marketType;
    inProcess();
    //idCode.text =  widget.bloc.state.idCode;
  }

  void inProcess() async {
    String tabIndex = await SecureStorage.readSecureStorage('market_id');
    String marketId = await SecureStorage.readSecureStorage(
      'marketActiveTabIndex',
    );

    if (tabIndex != 'ND' && marketId != 'ND') {
      isInProcess = true;
    } else {
      isInProcess = false;
      print('object');
    }
  }

  submit(CreateWorkSpaceBloc bloc) {
    if (_formKey.currentState!.validate() &&
        bloc.state.marketType.isNotEmpty &&
        bloc.state.activeCategoryIndex >= 0) {
      bloc.add(
        CreateMarket(
          businessId: businessId.text,
          name: name.text,
          description: description.text,
          slogan: slogan.text,
          marketType: selectedValue,
          subCategory: selectedCategoryId,
        ),
      );

      // bloc.add(const ChangeCategoryIndex(activeCategoryIndex: -1));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colora.borderAvatar,
          content: Text(
            "لطفا تمامی فیلد های لازم را پر نمایید.",
            style: TextStyle(color: Colora.scaffold),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CreateWorkSpaceBloc>(context);
    bool isMarketTypeShop = bloc.state.marketType == "shop";
    return Container(
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
                child: Assets.images.toolsThatYouShouldHave.image(
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),

            //text fields
            Container(
              width: Dimensions.width,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              margin: EdgeInsets.only(bottom: Dimensions.height * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colora.primaryColor,
              ),
              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SimpleTitle(title: 'انتخاب قالب'),

                    BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            radioButton(
                              title: "فروشگاهی",
                              value: "shop",
                              groupValue: state.marketType,
                              onChanged: (value) {
                                context.read<CreateWorkSpaceBloc>().add(
                                  SetMarketType(marketType: value!),
                                );
                              },
                            ),
                            radioButton(
                              title: "شرکتی",
                              value: "company",
                              groupValue: state.marketType,
                              onChanged: (value) {
                                context.read<CreateWorkSpaceBloc>().add(
                                  SetMarketType(marketType: value!),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomTextField(
                      controller: businessId,
                      isRequired: true,
                      text: isMarketTypeShop ? "شناسه کسب و کار" : "شناسه شرکت",
                      validator: Validators.simpleFieldEmpty,
                    ),
                    const SizedBox(height: 7),
                    CustomTextField(
                      isRequired: true,
                      controller: name,
                      text: isMarketTypeShop ? "نام کسب و کار" : "نام شرکت",
                      validator: Validators.simpleFieldEmpty,
                    ),
                    const SizedBox(height: 7),
                    CustomTextField(
                      isRequired: true,
                      controller: description,
                      text: "توضیحات",
                      maxLine: 6,
                      validator: Validators.simpleFieldEmpty,
                    ),
                    const SizedBox(height: 7),
                    CustomTextField(
                      isRequired: true,
                      controller: slogan,
                      text: isMarketTypeShop ? "شعار تبلیغاتی" : "شعار شرکت",
                      validator: Validators.simpleFieldEmpty,
                    ),
                    const SizedBox(height: 7),
                    CustomTextField(
                      maxLength: isMarketTypeShop ? 10 : 11,
                      keyboardType: TextInputType.number,
                      controller: idCode,
                      text: isMarketTypeShop ? "کد ملی" : "شناسه ملی",
                      validator:
                          isMarketTypeShop
                              ? Validators.iranianNationalCodeValidator
                              : Validators.companyValidation,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "کد ملی صرفا جهت تخصیص آگهی به شما میباشد",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: Dimensions.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.twenty),
                        color: Colora.scaffold,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          context.push(Routes.jobManagement);
                          context.read<JobmanagmentBloc>().add(LoadCategory());
                        },
                        child: Text(
                          context
                              .read<CreateWorkSpaceBloc>()
                              .state
                              .selectedCategoryName,
                          style: const TextStyle(
                            color: Colora.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // text: selectedCategoryName,
                        // color: Colors.white,
                        // textColor: Colora.primaryColor,
                        // height: Dimensions.height * 0.05,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            isInProcess
                                ? CustomButton(
                                  onPress: () async {
                                    await SecureStorage.deleteSecureStorage(
                                      'market_id',
                                    );
                                    await SecureStorage.deleteSecureStorage(
                                      'marketActiveTabIndex',
                                    );
                                    if (businessId.text.isNotEmpty &&
                                        name.text.isNotEmpty &&
                                        description.text.isNotEmpty &&
                                        slogan.text.isNotEmpty &&
                                        idCode.text.isNotEmpty) {
                                      // bloc.add(
                                      //   const ChangeCategoryIndex(
                                      //     activeCategoryIndex: -1,
                                      //   ),
                                      // );
                                      // bloc.add(CreateMarket(
                                      //   businessId: businessId.text,
                                      //   name: name.text,
                                      //   description: description.text,
                                      //   slogan: slogan.text,
                                      //   marketType: selectedValue,
                                      //   subCategory: 1,
                                      // ));
                                      // bloc.add(
                                      //   const ChangeTabView(activeTabIndex: 1),
                                      // );
                                    } else {
                                      if (!context.mounted) return;
                                      showSnackBar(
                                        context,

                                        "لطفا تمامی فیلد های لازم را پر نمایید.",
                                      );
                                    }
                                  },
                                  text:
                                      BlocProvider.of<CreateWorkSpaceBloc>(
                                                context,
                                              ).state.status ==
                                              CWSStatus.loading
                                          ? null
                                          : "ویرایش",
                                  color: Colors.white,
                                  textColor: Colora.primaryColor,
                                  height: 40,
                                  width: 100,
                                  btnWidget:
                                      BlocProvider.of<CreateWorkSpaceBloc>(
                                                context,
                                              ).state.status ==
                                              CWSStatus.loading
                                          ? const Center(
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                          : null,
                                )
                                : CustomButton(
                                  onPress: () => submit(bloc),
                                  text:
                                      BlocProvider.of<CreateWorkSpaceBloc>(
                                                context,
                                              ).state.status ==
                                              CWSStatus.loading
                                          ? null
                                          : "بعدی",
                                  color: Colors.white,
                                  textColor: Colora.primaryColor,
                                  height: 40,
                                  width: 100,
                                  btnWidget:
                                      BlocProvider.of<CreateWorkSpaceBloc>(
                                                context,
                                              ).state.status ==
                                              CWSStatus.loading
                                          ? const Center(
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                          : null,
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
}
