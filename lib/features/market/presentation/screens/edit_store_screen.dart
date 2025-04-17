import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/models/market_model.dart';
import 'package:asood/core/widgets/custom_bottom_navbar.dart';

import 'package:flutter/material.dart';

import '../widgets/store_appbar.dart';

class EditStoreScreen extends StatelessWidget {
  const EditStoreScreen({super.key, required this.market});
  final MarketModel market;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(
        context: context,
        title: market.name!,
        description: market.name!,
        appbarTools: Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Center(
            child: Container(
              height: 40,
              width: Dimensions.width * .8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colora.primaryColor,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(Icons.save, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(Icons.bookmark, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(
                        Icons.upload_file_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed");
                      },
                      icon: const Icon(Icons.list_alt, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: Dimensions.height,
          width: Dimensions.width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: Dimensions.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colora.primaryColor.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  height: 50,
                  width: Dimensions.width,
                  child: const ScrollableButtonList(),
                ),
                const Center(child: Text('فروش ابزار و یراق')),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class ScrollableButtonList extends StatefulWidget {
  const ScrollableButtonList({super.key});

  @override
  State<ScrollableButtonList> createState() => _ScrollableButtonListState();
}

class _ScrollableButtonListState extends State<ScrollableButtonList> {
  List<String> buttonTitles = ["محصولات", "ویژه ها", "نظرات", "ارتباط با ما"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      selectedIndex == index
                          ? WidgetStateProperty.all(Colora.primaryColor)
                          : WidgetStateProperty.all(Colors.white),
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0), // Remove box shadow
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(
                        color: Colora.primaryColor, // Specify the border color
                      ),
                    ),
                  ),
                ),
                child: Text(
                  buttonTitles[index],
                  style: TextStyle(
                    color:
                        selectedIndex == index
                            ? Colors.white
                            : Colora.primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
