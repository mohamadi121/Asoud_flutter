import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/utils/secure_storage.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:asood/core/widgets/radio_button.dart';
import 'package:asood/features/market/presentation/widgets/simple_title.dart';
import 'package:asood/features/vendor/presentation/blocs/create_workspace/create_workspace_bloc.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({required this.bloc, super.key});

  final CreateWorkSpaceBloc bloc;

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  String selectedValue = '';
  final TextEditingController name = TextEditingController();
  final TextEditingController businessId = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController slogan = TextEditingController();
  final TextEditingController idCode = TextEditingController();

  int selectedCategoryId = 0;
  String selectedCategoryName = 'انتخاب شغل';

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
    catBloc = BlocProvider.of<CreateWorkSpaceBloc>(context);
    catBloc.add(LoadCategory());
  }

  void inProcess() async {
    String tabIndex = await SecureStorage().readSecureStorage('market_id');
    String marketId = await SecureStorage().readSecureStorage(
      'marketActiveTabIndex',
    );

    if (tabIndex != 'ND' && marketId != 'ND') {
      isInProcess = true;
    } else {
      isInProcess = false;
      print('object');
    }
  }

  void category() {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0,
          ),
          insetPadding: const EdgeInsets.all(10),
          backgroundColor: Colora.scaffold,
          content: BlocBuilder<CreateWorkSpaceBloc, CreateWorkSpaceState>(
            builder: (context, state) {
              return SizedBox(
                width: Dimensions.width * 0.9,
                height: Dimensions.height * 0.6,
                child: Row(
                  children: [
                    //main category
                    Container(
                      width: Dimensions.width * 0.35,
                      height: Dimensions.height * 0.6,
                      decoration: const BoxDecoration(
                        color: Colora.scaffold_,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: ListView.builder(
                          itemCount: state.categoryList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: Dimensions.height * 0.08,
                              decoration: BoxDecoration(
                                color:
                                    state.activeCategoryIndex == index
                                        ? Colora.primaryColor
                                        : Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colora.primaryColor.withOpacity(0.1),
                                  ),
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  catBloc.add(
                                    LoadMainSubCategory(
                                      categoryId: state.categoryList[index].id!,
                                    ),
                                  );
                                  catBloc.add(
                                    ChangeCategoryIndex(
                                      activeCategoryIndex: index,
                                    ),
                                  );
                                  // setState(() {
                                  //   countryName = state.countryList[index].name!;
                                  // });
                                  //
                                  // countryId = state.countryList[index].id!;
                                  // Navigator.of(context).pop();
                                },
                                child: Text(
                                  state.categoryList[index].title.toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color:
                                        state.activeCategoryIndex == index
                                            ? Colora.scaffold
                                            : Colora.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // main sub category
                    SizedBox(
                      width: Dimensions.width * 0.55,
                      height: Dimensions.height * 0.6,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: ListView.builder(
                          itemCount: state.mainSubCategoryList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                //button
                                InkWell(
                                  child: Container(
                                    width: Dimensions.width * 0.55,
                                    height: Dimensions.height * 0.08,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width * 0.05,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colora.backgroundSwitch
                                          .withOpacity(0.8),
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colora.scaffold.withOpacity(
                                            0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state
                                              .mainSubCategoryList[index]
                                              .title!,
                                          style: TextStyle(
                                            color: Colora.scaffold,
                                            fontSize: Dimensions.width * 0.035,
                                          ),
                                        ),
                                        Icon(
                                          state.activeSubCategoryIndex ==
                                                  state
                                                      .mainSubCategoryList[index]
                                                      .id!
                                              ? Icons.arrow_drop_up_rounded
                                              : Icons.arrow_drop_down_rounded,
                                          color: Colora.scaffold,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    if (state.activeSubCategoryIndex !=
                                        state.mainSubCategoryList[index].id!) {
                                      catBloc.add(
                                        ChangeSubCategoryIndex(
                                          activeSubCategoryIndex:
                                              state
                                                  .mainSubCategoryList[index]
                                                  .id!,
                                        ),
                                      );
                                      catBloc.add(
                                        LoadSubCategory(
                                          subCategoryId:
                                              state
                                                  .mainSubCategoryList[index]
                                                  .id!,
                                        ),
                                      );
                                    } else {
                                      catBloc.add(
                                        const ChangeSubCategoryIndex(
                                          activeSubCategoryIndex: -1,
                                        ),
                                      );
                                    }
                                  },
                                ),

                                //sub category
                                if (state.activeSubCategoryIndex ==
                                    state.mainSubCategoryList[index].id!) ...[
                                  ...List.generate(
                                    state.subCategoryList.length,
                                    (index) {
                                      return InkWell(
                                        child: Container(
                                          width: Dimensions.width * 0.55,
                                          height: Dimensions.height * 0.08,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width * 0.05,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colora.backgroundSwitch
                                                .withOpacity(0.2),
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colora.scaffold
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state
                                                  .subCategoryList[index]
                                                  .title!,
                                              style: TextStyle(
                                                color: Colora.primaryColor,
                                                fontSize:
                                                    Dimensions.width * 0.035,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          selectedCategoryId =
                                              state.subCategoryList[index].id!;

                                          setState(() {
                                            selectedCategoryName =
                                                state
                                                    .subCategoryList[index]
                                                    .title!;
                                          });

                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CreateWorkSpaceBloc>(context);

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
                child: Image.asset(
                  'assets/images/tools-that-you-should-have.jpg',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SimpleTitle(title: 'انتخاب قالب'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      radioButton(
                        title: "فروشگاهی",
                        value: "shop",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                      radioButton(
                        title: "شرکتی",
                        value: "company",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          //set market type
                          bloc.add(SetMarketType(marketType: value!));
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  CustomTextField(
                    controller: businessId,
                    isRequired: true,
                    text: "شناسه کسب و کار",
                  ),
                  const SizedBox(height: 7),
                  CustomTextField(
                    isRequired: true,
                    controller: name,
                    text: "نام کسب و کار",
                  ),
                  const SizedBox(height: 7),
                  CustomTextField(
                    isRequired: true,
                    controller: description,
                    text: "توضیحات",
                    maxLine: 6,
                  ),
                  const SizedBox(height: 7),
                  CustomTextField(
                    isRequired: true,
                    controller: slogan,
                    text: "شعار تبلیغاتی",
                  ),
                  const SizedBox(height: 7),
                  CustomTextField(
                    isRequired: true,
                    controller: idCode,
                    text: "کد ملی",
                    keyboardType: TextInputType.number,
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
                      onPressed: () => category(),
                      child: Text(
                        selectedCategoryName,
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
                                  await SecureStorage().deleteSecureStorage(
                                    'market_id',
                                  );
                                  await SecureStorage().deleteSecureStorage(
                                    'marketActiveTabIndex',
                                  );
                                  if (businessId.text.isNotEmpty &&
                                      name.text.isNotEmpty &&
                                      description.text.isNotEmpty &&
                                      slogan.text.isNotEmpty &&
                                      idCode.text.isNotEmpty) {
                                    bloc.add(
                                      const ChangeCategoryIndex(
                                        activeCategoryIndex: -1,
                                      ),
                                    );
                                    // bloc.add(CreateMarket(
                                    //   businessId: businessId.text,
                                    //   name: name.text,
                                    //   description: description.text,
                                    //   slogan: slogan.text,
                                    //   marketType: selectedValue,
                                    //   subCategory: 1,
                                    // ));
                                    // bloc.add(const ChangeTabView(activeTabIndex: 1));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colora.borderAvatar,
                                        content: Text(
                                          "لطفا تمامی فیلد های لازم را پر نمایید.",
                                          style: TextStyle(
                                            color: Colora.scaffold,
                                          ),
                                        ),
                                      ),
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
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                        : null,
                              )
                              : CustomButton(
                                onPress: () {
                                  if (businessId.text.isNotEmpty &&
                                      name.text.isNotEmpty &&
                                      description.text.isNotEmpty &&
                                      slogan.text.isNotEmpty &&
                                      idCode.text.isNotEmpty &&
                                      selectedCategoryId != 0) {
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

                                    bloc.add(
                                      const ChangeCategoryIndex(
                                        activeCategoryIndex: -1,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colora.borderAvatar,
                                        content: Text(
                                          "لطفا تمامی فیلد های لازم را پر نمایید.",
                                          style: TextStyle(
                                            color: Colora.scaffold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
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
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                        : null,
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
