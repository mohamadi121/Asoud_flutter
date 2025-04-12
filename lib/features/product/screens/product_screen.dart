import 'package:asood/core/constants/constants.dart';
import 'package:asood/features/product/widgets/product_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //for app bar
                    SizedBox(height: Dimensions.height * 0.08),

                    //image
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: Dimensions.height * 0.015,
                        ),
                        decoration: const BoxDecoration(
                          color: Colora.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32),
                            bottomLeft: Radius.circular(32),
                          ),
                        ),
                        child: Stack(
                          children: [
                            //image
                            Positioned(
                              bottom: 0,
                              top: 0,
                              width: Dimensions.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                ),
                                child: Image.asset(
                                  'assets/images/tools-that-you-should-have.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            //arrows
                            Positioned(
                              bottom: 0,
                              top: 0,
                              width: Dimensions.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colora.primaryColor.withOpacity(
                                        0.8,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.chevron_left_rounded,
                                        color: Colora.scaffold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colora.primaryColor.withOpacity(
                                        0.8,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colora.scaffold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //discount
                    Container(
                      width: Dimensions.width,
                      height: Dimensions.height * 0.07,
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height * 0.01,
                        horizontal: Dimensions.width * 0.05,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Colora.primaryColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //text
                          Container(
                            width: Dimensions.width * 0.4,
                            height: Dimensions.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colora.scaffold,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width * 0.01,
                            ),
                            child: const Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '٪۲۰ تخفیف برای ۲۰ نفر به مدت ۲۰ روز',
                                  style: TextStyle(
                                    color: Colora.primaryColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //sec
                          Container(
                            width: Dimensions.width * 0.1,
                            decoration: const BoxDecoration(
                              color: Colora.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '10',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //min
                          Container(
                            width: Dimensions.width * 0.1,
                            decoration: const BoxDecoration(
                              color: Colora.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '30',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //hour
                          Container(
                            width: Dimensions.width * 0.1,
                            decoration: const BoxDecoration(
                              color: Colora.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '21',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //day
                          Container(
                            width: Dimensions.width * 0.1,
                            decoration: const BoxDecoration(
                              color: Colora.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '19',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //base
                    Container(
                      width: Dimensions.width,
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height * 0.01,
                        horizontal: Dimensions.width * 0.05,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colora.lightBlue,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        children: [
                          //title
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(26),
                                topRight: Radius.circular(26),
                              ),
                              border: Border(
                                bottom: BorderSide(color: Colora.lightBlue),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'تعمیر دریل',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colora.scaffold,
                                ),
                              ),
                            ),
                          ),

                          //price
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colora.lightBlue,
                                  width: 6,
                                ),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '400.000 - 500.000',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colora.scaffold,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                            ),
                            child: const Text(
                              'جدید - سیم پیچی',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                              ),
                            ),
                          ),

                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                              border: Border(
                                bottom: BorderSide(color: Colora.lightBlue),
                              ),
                            ),
                            child: const Text(
                              'سه نظام',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                              ),
                            ),
                          ),

                          //gift - title
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                            ),
                            child: const Text(
                              'هدایا :',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          //gift
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                              border: Border(
                                bottom: BorderSide(color: Colora.lightBlue),
                              ),
                            ),
                            child: const Text(
                              'دریل برقی شارژی',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                              ),
                            ),
                          ),

                          //spec - title
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                            ),
                            child: const Text(
                              'مشخصات فنی :',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          //spec
                          Container(
                            width: Dimensions.width,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                              horizontal: Dimensions.width * 0.05,
                            ),
                            decoration: const BoxDecoration(
                              color: Colora.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(26),
                                bottomRight: Radius.circular(26),
                              ),
                              border: Border(
                                bottom: BorderSide(color: Colora.lightBlue),
                              ),
                            ),
                            child: const Text(
                              '100w',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colora.scaffold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //gift
                    Container(
                      width: Dimensions.width,
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height * 0.01,
                        horizontal: Dimensions.width * 0.05,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colora.primaryColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'کالاهای همراه :',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: Dimensions.height * 0.1,
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (context, index) => Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width * 0.01,
                                      vertical: Dimensions.height * 0.005,
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colora.scaffold,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            //image
                                            AspectRatio(
                                              aspectRatio: 4 / 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colora.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            //text
                                            const Padding(
                                              padding: EdgeInsets.only(top: 2),
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'ویزیت دکتر',
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colora.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //comment title
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.height * 0.01),
                      child: const Text(
                        'نظرات کاربران',
                        style: TextStyle(
                          color: Colora.primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),

                    Divider(
                      color: Colora.lightBlue,
                      indent: Dimensions.width * 0.1,
                      endIndent: Dimensions.width * 0.1,
                    ),

                    //input
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //name
                            Container(
                              width: Dimensions.width * 0.43,
                              height: Dimensions.height * 0.06,
                              margin: EdgeInsets.only(
                                right: Dimensions.width * 0.05,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colora.lightBlue,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: const TextField(
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colora.scaffold_,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'نام و نام خانوادگی',
                                  hintStyle: TextStyle(
                                    color: Colora.scaffold_,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                            //email
                            Container(
                              width: Dimensions.width * 0.43,
                              height: Dimensions.height * 0.06,
                              margin: EdgeInsets.only(
                                left: Dimensions.width * 0.05,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colora.lightBlue,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: const TextField(
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colora.scaffold_,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'ایمیل',
                                  hintStyle: TextStyle(
                                    color: Colora.scaffold_,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: Dimensions.width,
                          margin: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                            horizontal: Dimensions.width * 0.05,
                          ),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colora.lightBlue,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Column(
                            children: [
                              const TextField(
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colora.scaffold_,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'پیام شما ...',
                                  hintStyle: TextStyle(
                                    color: Colora.scaffold_,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              //send button
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: Dimensions.width * 0.2,
                                  height: Dimensions.height * 0.04,
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    color: Colora.primaryColor,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'ارسال',
                                      style: TextStyle(color: Colora.scaffold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: Dimensions.width,
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height * 0.01,
                        horizontal: Dimensions.width * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: Dimensions.width * 0.15,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colora.scaffold,
                                          border: Border.all(
                                            color: Colora.lightBlue,
                                            width: 2,
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/logo_svg.svg',
                                          colorFilter: const ColorFilter.mode(
                                            Colora.lightBlue,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      'پشتیبان',
                                      style: TextStyle(
                                        color: Colora.primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: Dimensions.width * 0.74,
                                margin: EdgeInsets.only(
                                  right: Dimensions.width * 0.01,
                                ),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colora.lightBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Colora.scaffold,
                                        fontSize: 12,
                                      ),
                                    ),

                                    //send button
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: Dimensions.width * 0.2,
                                        height: Dimensions.height * 0.04,
                                        decoration: BoxDecoration(
                                          color: Colora.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            36,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'پاسخ',
                                            style: TextStyle(
                                              color: Colora.scaffold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              right: Dimensions.width * 0.1,
                              top: Dimensions.height * 0.01,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: Dimensions.width * 0.15,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colora.scaffold,
                                            border: Border.all(
                                              color: Colora.lightBlue,
                                              width: 2,
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/images/logo_svg.svg',
                                            colorFilter: const ColorFilter.mode(
                                              Colora.lightBlue,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        'حسین',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: Dimensions.width * 0.64,
                                  margin: EdgeInsets.only(
                                    right: Dimensions.width * 0.01,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colora.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 12,
                                        ),
                                      ),

                                      //send button
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: Dimensions.width * 0.2,
                                          height: Dimensions.height * 0.04,
                                          decoration: BoxDecoration(
                                            color: Colora.lightBlue,
                                            borderRadius: BorderRadius.circular(
                                              36,
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'پاسخ',
                                              style: TextStyle(
                                                color: Colora.scaffold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Dimensions.height * 0.02),
                  ],
                ),
              ),

              const ProductAppBar(title: 'تعمیر دریل'),
            ],
          ),
        ),
      ),
    );
  }
}
