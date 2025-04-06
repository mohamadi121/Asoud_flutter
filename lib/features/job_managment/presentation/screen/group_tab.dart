import 'package:asood/features/job_managment/presentation/bloc/jobmanagment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';

import 'package:asood/core/widgets/custom_button.dart';

class GroupTab extends StatefulWidget {
  final JobmanagmentBloc bloc;
  const GroupTab({required this.bloc, super.key});

  @override
  State<GroupTab> createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  String selectedCategoryId = "0";

  late JobmanagmentBloc catBloc;

  @override
  void initState() {
    super.initState();
    // name.text = widget.bloc.state.name;
    // businessId.text = widget.bloc.state.businessId;
    // description.text = widget.bloc.state.description;
    // slogan.text = widget.bloc.state.slogan;
    // selectedValue = widget.bloc.state.marketType;
    // inProcess();
    //idCode.text =  widget.bloc.state.idCode;
  }

  // void inProcess() async {
  //   String tabIndex = await SecureStorage.readSecureStorage('market_id');
  //   String marketId = await SecureStorage.readSecureStorage(
  //     'marketActiveTabIndex',
  //   );

  //   if (tabIndex != 'ND' && marketId != 'ND') {
  //     isInProcess = true;
  //   } else {
  //     isInProcess = false;
  //     print('object');
  //   }
  // }

  // submit(CreateWorkSpaceBloc bloc) {
  //   if (_formKey.currentState!.validate() &&
  //       bloc.state.marketType.isNotEmpty &&
  //       bloc.state.activeCategoryIndex >= 0) {
  //     bloc.add(
  //       CreateMarket(
  //         businessId: businessId.text,
  //         name: name.text,
  //         description: description.text,
  //         slogan: slogan.text,
  //         marketType: selectedValue,
  //         subCategory: selectedCategoryId,
  //       ),
  //     );

  //     // bloc.add(const ChangeCategoryIndex(activeCategoryIndex: -1));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colora.borderAvatar,
  //         content: Text(
  //           "لطفا تمامی فیلد های لازم را پر نمایید.",
  //           style: TextStyle(color: Colora.scaffold),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<JobmanagmentBloc>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.khorisontal),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  CustomButton(
                    onPress: () {},
                    text:
                        BlocProvider.of<JobmanagmentBloc>(
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
                        BlocProvider.of<JobmanagmentBloc>(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
