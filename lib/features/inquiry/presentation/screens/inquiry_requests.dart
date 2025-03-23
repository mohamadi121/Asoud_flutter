import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/router/app_router.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:asood/core/widgets/search_box.dart';
import 'package:asood/core/widgets/simple_bot_navbar.dart';
import 'package:asood/core/widgets/store_card.dart';
import 'package:asood/features/vendor/presentation/blocs/workspace/workspace_bloc.dart';

@RoutePage()
class InquiryRequestsScreen extends StatelessWidget {
  const InquiryRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: DefaultAppBar(context: context),
      body: SafeArea(
        // maintainBottomViewPadding: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SearchBoxWidget()),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return StoreCard(
                    bloc: BlocProvider.of<WorkspaceBloc>(context),
                    index: index,
                    market:
                        BlocProvider.of<WorkspaceBloc>(
                          context,
                        ).state.storesList[index],
                  );
                },
                childCount:
                    BlocProvider.of<WorkspaceBloc>(
                      context,
                    ).state.storesList.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPress: () {
                        context.router.push(const SubmitFeeInquiryRoute());
                        /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubmitFeeInquiryScreen(),
                          ),
                        ); */
                      },
                      text: "درخواست جدید",
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const SimpleBotNavBar(),
    );
  }
}
