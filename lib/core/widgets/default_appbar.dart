import 'package:asood/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'hamberger_menu.dart';
import 'profile_menu_widget.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  final String? title;

  const DefaultAppBar({required this.context, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      title: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title == 'home') ...[
              const Text(
                'آســود',
                style: TextStyle(
                  color: Colora.scaffold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'خیالی آسوده با آسود',
                style: TextStyle(
                  color: Colora.scaffold,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ] else ...[
              Text(
                title!,
                style: const TextStyle(
                  color: Colora.scaffold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            showProfileDialog(context);
          },
          icon: Icon(
            Icons.menu,
            color: Colora.scaffold,
            size: Dimensions.width * 0.07,
          ),
        ),

        // Profile button
        // IconButton(
        //   icon: const Icon(Icons.account_circle),
        //   onPressed: () {
        //     showProfileDialog(context);
        //   },
        // ),
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height * 0.01,
              horizontal: Dimensions.width * 0.02,
            ),
            // height: Dimensions.height * 0.5,
            // width: Dimensions.width * 0.1,
            child:
                title == 'home'
                    ? InkWell(
                      child: const Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/placeholder.jpg',
                          ),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const MenuDialog(),
                        );
                      },
                    )
                    : IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colora.scaffold,
                        size: Dimensions.width * 0.07,
                      ),
                    ),
          );
          // return IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) => const MenuDialog(),
          //     );
          //   },
          // );
        },
      ),
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(40), // Adjust the value as needed
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_app_bar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(
                255,
                0,
                4,
                253,
              ).withOpacity(0.5), // Adjust opacity as needed
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16), // Adjust the value as needed
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class NewAppBar extends StatelessWidget {
  final String title;

  const NewAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height * 0.11,
      width: Dimensions.width,
      decoration: const BoxDecoration(
        color: Colora.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          //image
          Container(
            height: Dimensions.height * 0.1,
            width: Dimensions.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/home_app_bar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //shade
          Container(
            height: Dimensions.height * 0.1,
            width: Dimensions.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Colora.primaryColor.withOpacity(0.6),
            ),
          ),

          //user profile image
          Positioned(
            top: Dimensions.height * 0.02,
            right: 10,
            width: Dimensions.width * 0.1,
            child: SizedBox(
              width: Dimensions.width * 0.1,
              child:
                  title == 'home'
                      ? InkWell(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colora.scaffold,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/placeholder.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const MenuDialog(),
                          );
                        },
                      )
                      : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colora.scaffold,
                          size: Dimensions.width * 0.07,
                        ),
                      ),
            ),
          ),

          //menu button
          Positioned(
            top: Dimensions.height * 0.02,
            left: 10,
            width: Dimensions.width * 0.1,
            child: IconButton(
              onPressed: () {
                showProfileDialog(context);
              },
              icon: Icon(
                Icons.menu,
                color: Colora.scaffold,
                size: Dimensions.width * 0.07,
              ),
            ),
          ),

          //title
          Positioned(
            right: Dimensions.width * 0.25,
            left: Dimensions.width * 0.25,
            child: SizedBox(
              width: Dimensions.width * 0.5,
              height: Dimensions.height * 0.11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title == 'home') ...[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'آســود',
                        style: TextStyle(
                          color: Colora.scaffold,
                          fontSize: Dimensions.width * 0.065,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'خیالی آسوده با آسود',
                        style: TextStyle(
                          color: Colora.scaffold,
                          fontSize: Dimensions.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ] else ...[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colora.scaffold,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
