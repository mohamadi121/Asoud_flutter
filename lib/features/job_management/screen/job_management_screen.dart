import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'add_category_tab.dart';
import 'add_subcategory_tab.dart';
import 'add_group_tab.dart';

@RoutePage()
class JobManagementScreen extends StatefulWidget {
  const JobManagementScreen({super.key});

  @override
  State<JobManagementScreen> createState() => _JobManagementScreenState();
}

class _JobManagementScreenState extends State<JobManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _activeTabIndex; // To keep track of the active tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    _activeTabIndex = _tabController.index; // Set initial active tab index
  }

  void _onTabChanged() {
    setState(() {
      _activeTabIndex = _tabController.index; // Update the active tab index
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: DefaultAppBar(context: context),
  //     body: SafeArea(
  //       child: Container(
  //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         child: const SingleChildScrollView(
  //             scrollDirection: Axis.vertical,
  //             child: Expanded(child: AddGroup())),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context: context),
      body: Container(
        width: Dimensions.width,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: null,
                  indicatorColor: Colors.transparent, // Remove indicator color
                  tabs: [
                    buildTab('گروه‌ها', 0),
                    buildTab('دسته‌ها', 1),
                    buildTab('زیردسته‌ها', 2),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      AddGroup(),
                      AddCategory(),
                      AddSubCategory(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab(String label, int tabIndex) {
    bool isActive = _activeTabIndex == tabIndex; // Check if tab is active

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      // margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color:
            isActive
                ? Colors.white
                : Colors.purple, // White when active, purple otherwise
        borderRadius: BorderRadius.circular(50), // Border radius for each tab
        border:
            isActive
                ? Border.all(color: Colors.purple) // Purple border when active
                : null, // No border otherwise
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(color: isActive ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
