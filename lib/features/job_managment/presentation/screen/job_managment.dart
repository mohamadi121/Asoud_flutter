import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/features/job_managment/presentation/bloc/jobmanagment_bloc.dart';
import 'package:asood/features/job_managment/presentation/screen/group_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/helper/secure_storage.dart';
import 'package:asood/core/helper/snack_bar_util.dart';
import 'package:asood/core/widgets/appbar/default_appbar.dart';

class JobManagementScreen extends StatefulWidget {
  const JobManagementScreen({super.key});

  @override
  State<JobManagementScreen> createState() => _JobManagementScreenState();
}

class _JobManagementScreenState extends State<JobManagementScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(_onTabChanged);
    _restoreProgress();
  }

  void _restoreProgress() async {
    final marketId = await SecureStorage.readSecureStorage('market_id');
    final tabIndex = await SecureStorage.readSecureStorage(
      'marketActiveTabIndex',
    );

    if (marketId != 'ND' && tabIndex != 'ND') {
      final index = int.tryParse(tabIndex);
      if (index != null) {
        _activeTabIndex = index;
        if (mounted) {
          context.read<JobmanagmentBloc>().add(
            ChangeTabView(activeTabIndex: index),
          );
        }
      }
    }
  }

  void _onTabChanged() {
    final newIndex = _tabController.index;
    if (newIndex != _activeTabIndex) {
      _activeTabIndex = newIndex;
      context.read<JobmanagmentBloc>().add(
        ChangeTabView(activeTabIndex: newIndex),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<JobmanagmentBloc>();

    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<JobmanagmentBloc, JobmanagmentState>(
            listener: (context, state) {
              if (_tabController.index != state.activeTabIndex) {
                _tabController.index = state.activeTabIndex;
              }

              if (state.status == CWSStatus.failure) {
                showSnackBar(context, "مشکلی پیش آمده مجددا تلاش کنید");
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Appbar Space
                        const SizedBox(height: 80),
                        _buildTabBar(state),
                        SizedBox(
                          height: Dimensions.height * 0.795,
                          child: TabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              GroupTab(bloc: bloc),
                              GroupTab(bloc: bloc),
                              GroupTab(bloc: bloc),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const NewAppBar(title: "مدیریت مشاغل"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(JobmanagmentState state) {
    return IgnorePointer(
      ignoring: true,
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        tabs: [
          _buildTab(state, "تعریف گروه", 0),
          _buildTab(state, "تعریف دسته", 1),
          _buildTab(state, "تعریف زیردسته", 2),
        ],
      ),
    );
  }

  Widget _buildTab(JobmanagmentState state, String label, int index) {
    final isActive = state.activeTabIndex == index;
    final tabColor = isActive ? Colora.primaryColor : Colors.white;
    final textColor = isActive ? Colors.white : Colora.primaryColor;

    return Container(
      width: Dimensions.width * 0.3,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: tabColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colora.primaryColor, width: 2),
      ),
      child: Center(
        child: FittedBox(
          child: Text(label, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}

//  void category() {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //         ),
  //         contentPadding: const EdgeInsets.symmetric(
  //           horizontal: 0.0,
  //           vertical: 0,
  //         ),
  //         insetPadding: const EdgeInsets.all(10),
  //         backgroundColor: Colora.scaffold,
  //         content: BlocBuilder<JobmanagmentBloc, JobmanagmentState>(
  //           builder: (context, state) {
  //             return SizedBox(
  //               width: Dimensions.width * 0.9,
  //               height: Dimensions.height * 0.6,
  //               child: Row(
  //                 children: [
  //                   //main category
  //                   Container(
  //                     width: Dimensions.width * 0.35,
  //                     height: Dimensions.height * 0.6,
  //                     decoration: const BoxDecoration(
  //                       color: Colora.scaffold_,
  //                       borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(20.0),
  //                         bottomRight: Radius.circular(20.0),
  //                       ),
  //                     ),
  //                     child: ClipRRect(
  //                       borderRadius: const BorderRadius.only(
  //                         topRight: Radius.circular(20),
  //                         bottomRight: Radius.circular(20),
  //                       ),
  //                       child: ListView.builder(
  //                         itemCount: state.categoryList.length,
  //                         itemBuilder: (context, index) {
  //                           return Container(
  //                             height: Dimensions.height * 0.08,
  //                             decoration: BoxDecoration(
  //                               color:
  //                                   state.activeCategoryIndex == index
  //                                       ? Colora.primaryColor
  //                                       : Colors.transparent,
  //                               border: Border(
  //                                 bottom: BorderSide(
  //                                   color: Colora.primaryColor.withValues(
  //                                     alpha: 0.1,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             child: MaterialButton(
  //                               onPressed: () {
  //                                 catBloc.add(
  //                                   LoadMainSubCategory(
  //                                     categoryId: state.categoryList[index].id!,
  //                                   ),
  //                                 );
  //                                 catBloc.add(
  //                                   ChangeCategoryIndex(
  //                                     activeCategoryIndex: index,
  //                                   ),
  //                                 );
  //                                 // setState(() {
  //                                 //   countryName = state.countryList[index].name!;
  //                                 // });
  //                                 //
  //                                 // countryId = state.countryList[index].id!;
  //                                 // Navigator.of(context).pop();
  //                               },
  //                               child: Text(
  //                                 state.categoryList[index].title.toString(),
  //                                 textAlign: TextAlign.center,
  //                                 maxLines: 3,
  //                                 style: TextStyle(
  //                                   color:
  //                                       state.activeCategoryIndex == index
  //                                           ? Colora.scaffold
  //                                           : Colora.primaryColor,
  //                                   fontSize: 15,
  //                                   fontWeight: FontWeight.w700,
  //                                 ),
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ),

  //                   // main sub category
  //                   SizedBox(
  //                     width: Dimensions.width * 0.55,
  //                     height: Dimensions.height * 0.6,
  //                     child: ClipRRect(
  //                       borderRadius: const BorderRadius.only(
  //                         topLeft: Radius.circular(20),
  //                         bottomLeft: Radius.circular(20),
  //                       ),
  //                       child: ListView.builder(
  //                         itemCount: state.mainSubCategoryList.length,
  //                         itemBuilder: (context, index) {
  //                           return Column(
  //                             children: [
  //                               //button
  //                               InkWell(
  //                                 child: Container(
  //                                   width: Dimensions.width * 0.55,
  //                                   height: Dimensions.height * 0.08,
  //                                   padding: EdgeInsets.symmetric(
  //                                     horizontal: Dimensions.width * 0.05,
  //                                   ),
  //                                   decoration: BoxDecoration(
  //                                     color: Colora.backgroundSwitch.withValues(
  //                                       alpha: 0.8,
  //                                     ),
  //                                     border: Border(
  //                                       bottom: BorderSide(
  //                                         color: Colora.scaffold.withValues(
  //                                           alpha: 0.2,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   child: Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Text(
  //                                         state
  //                                             .mainSubCategoryList[index]
  //                                             .title!,
  //                                         style: TextStyle(
  //                                           color: Colora.scaffold,
  //                                           fontSize: Dimensions.width * 0.035,
  //                                         ),
  //                                       ),
  //                                       Icon(
  //                                         state.activeSubCategoryIndex ==
  //                                                 state
  //                                                     .mainSubCategoryList[index]
  //                                                     .id!
  //                                             ? Icons.arrow_drop_up_rounded
  //                                             : Icons.arrow_drop_down_rounded,
  //                                         color: Colora.scaffold,
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 onTap: () {
  //                                   if (state.activeSubCategoryIndex !=
  //                                       state.mainSubCategoryList[index].id) {
  //                                     catBloc.add(
  //                                       ChangeSubCategoryIndex(
  //                                         activeSubCategoryIndex:
  //                                             state
  //                                                 .mainSubCategoryList[index]
  //                                                 .id!,
  //                                       ),
  //                                     );
  //                                     catBloc.add(
  //                                       LoadSubCategory(
  //                                         subCategoryId:
  //                                             state
  //                                                 .mainSubCategoryList[index]
  //                                                 .id!,
  //                                       ),
  //                                     );
  //                                   } else {
  //                                     catBloc.add(
  //                                       const ChangeSubCategoryIndex(
  //                                         activeSubCategoryIndex: "-1",
  //                                       ),
  //                                     );
  //                                   }
  //                                 },
  //                               ),

  //                               //sub category
  //                               if (state.activeSubCategoryIndex ==
  //                                   state.mainSubCategoryList[index].id!) ...[
  //                                 ...List.generate(
  //                                   state.subCategoryList.length,
  //                                   (index) {
  //                                     return InkWell(
  //                                       child: Container(
  //                                         width: Dimensions.width * 0.55,
  //                                         height: Dimensions.height * 0.08,
  //                                         padding: EdgeInsets.symmetric(
  //                                           horizontal: Dimensions.width * 0.05,
  //                                         ),
  //                                         decoration: BoxDecoration(
  //                                           color: Colora.backgroundSwitch
  //                                               .withValues(alpha: 0.2),
  //                                           border: Border(
  //                                             bottom: BorderSide(
  //                                               color: Colora.scaffold
  //                                                   .withValues(alpha: 0.2),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         child: Center(
  //                                           child: Text(
  //                                             state
  //                                                 .subCategoryList[index]
  //                                                 .title!,
  //                                             style: TextStyle(
  //                                               color: Colora.primaryColor,
  //                                               fontSize:
  //                                                   Dimensions.width * 0.035,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       onTap: () {
  //                                         selectedCategoryId =
  //                                             state.subCategoryList[index].id!;
  //                                         context
  //                                             .read<JobmanagmentBloc>()
  //                                             .add(
  //                                               ChangeSelectedCategoryName(
  //                                                 selectedCat:
  //                                                     state
  //                                                         .subCategoryList[index]
  //                                                         .title!,
  //                                               ),
  //                                             );

  //                                         Navigator.pop(context);
  //                                       },
  //                                     );
  //                                   },
  //                                 ),
  //                               ],
  //                             ],
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
