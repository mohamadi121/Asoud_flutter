import 'package:asood/features/vendor/presentation/widget/basic_info.dart';
import 'package:asood/features/vendor/presentation/widget/contacts_info.dart';
import 'package:asood/features/vendor/presentation/widget/location_info.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/utils/secure_storage.dart';
import 'package:asood/core/utils/snack_bar_util.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:asood/features/vendor/presentation/blocs/create_workspace/create_workspace_bloc.dart';

@RoutePage()
class CreateWorkSpaceScreen extends StatefulWidget {
  const CreateWorkSpaceScreen({super.key});

  @override
  State<CreateWorkSpaceScreen> createState() => _CreateWorkSpaceScreenState();
}

class _CreateWorkSpaceScreenState extends State<CreateWorkSpaceScreen>
    with SingleTickerProviderStateMixin {
  bool switchValue = false;
  late TabController _tabController;
  int _activeTabIndex = 0;
  bool isMenuVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    inProcess();
    //_activeTabIndex = _tabController.index; // Set initial active tab index
    /* BlocProvider.of<CreateWorkSpaceBloc>(context)
        .add(ChangeTabView(activeTabIndex: _activeTabIndex)); */
  }

  void inProcess() async {
    String marketId = await SecureStorage().readSecureStorage('market_id');
    String tabIndex = await SecureStorage().readSecureStorage(
      'marketActiveTabIndex',
    );

    if (tabIndex != 'ND' && marketId != 'ND') {
      _activeTabIndex = int.parse(tabIndex);
      BlocProvider.of<CreateWorkSpaceBloc>(
        context,
      ).add(ChangeTabView(activeTabIndex: _activeTabIndex));
    }
  }

  void _onTabChanged() async {
    // setState(() {
    _activeTabIndex = _tabController.index; // Update the active tab index
    BlocProvider.of<CreateWorkSpaceBloc>(
      context,
    ).add(ChangeTabView(activeTabIndex: _activeTabIndex));
    //  });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          // appBar: DefaultAppBar(context: context),
          body: BlocConsumer<CreateWorkSpaceBloc, CreateWorkSpaceState>(
            listener: (context, state) {
              _tabController.index = state.activeTabIndex;
              _tabController.index > state.activeTabIndex
                  ? _tabController.index = state.activeTabIndex
                  : null;
              if (state.status == CWSStatus.success) {
                _tabController.index = state.activeTabIndex;
              } else if (state.status == CWSStatus.failure) {
                showSnackBar(context, "مشکلی پیش آمده مجددا تلاش کنید");
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.height * 0.01),
                      // padding: const EdgeInsets.symmetric(
                      //   vertical: 15, horizontal: Dimensions.khorisontal
                      // ),
                      child: Column(
                        children: [
                          // for appbar
                          SizedBox(height: Dimensions.height * 0.1),

                          // tab bar
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IgnorePointer(
                              ignoring: true,
                              child: TabBar(
                                controller: _tabController,
                                indicator: null,
                                indicatorPadding: EdgeInsets.zero,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelPadding: EdgeInsets.zero,

                                padding: EdgeInsets.zero,
                                dividerHeight: 0,
                                isScrollable: false,

                                indicatorColor:
                                    Colors
                                        .transparent, // Remove indicator color
                                tabs: [
                                  buildTab(state, 'مشخصات پایه', 0),
                                  buildTab(state, 'مشخصات ارتباطی', 1),
                                  buildTab(state, 'مشخصات مکانی', 2),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height * .795,
                            child: TabBarView(
                              controller: _tabController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                BasicInfo(
                                  bloc: BlocProvider.of<CreateWorkSpaceBloc>(
                                    context,
                                  ),
                                ),
                                ContactsInfo(
                                  bloc: BlocProvider.of<CreateWorkSpaceBloc>(
                                    context,
                                  ),
                                ),
                                LocationInfo(
                                  bloc: BlocProvider.of<CreateWorkSpaceBloc>(
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //appbar
                    const NewAppBar(title: 'ثبت دفتر کار'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTab(CreateWorkSpaceState state, String label, int tabIndex) {
    bool isActive = state.activeTabIndex == tabIndex; // Check if tab is active

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: Dimensions.width * 0.3,
      decoration: BoxDecoration(
        color:
            isActive
                ? Colora.primaryColor
                : Colors.white, // White when active, purple otherwise
        borderRadius: BorderRadius.circular(50), // Border radius for each tab
        border: Border.all(
          color: Colora.primaryColor,
          width: 2,
        ), // No border otherwise
      ),
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colora.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
