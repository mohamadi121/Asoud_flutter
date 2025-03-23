import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_dialog.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  bool switchValue = false;
  String prerequisite = "";

  @override
  Widget build(BuildContext context) {
    final buttonTexts = [
      "مشاغل فروشگاهی",
      "خدمات پزشکی و سلامت",
      "مشاغل خدماتی ثابت",
      "مشاغل خدماتی سیار",
      "واحدهای تولیدی",
      "شرکت‌های بازرگانی",
      "شرکت‌های خدماتی",
      "مجتمع‌های آموزشی",
      "مشاغل خانگی",
      "نیازمندی‌ها",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Dimensions.height * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colora.primaryColor,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: buttonTexts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 12,
                  ),
                  child: CustomButton(
                    onPress: () {},
                    height: 40,
                    text: buttonTexts[index],
                    color: Colors.white,
                    textColor: Colora.primaryColor,
                    width: Dimensions.width * 0.9,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 100,
                    onPress: () {},
                    text: "ویرایش",
                    color: Colora.primaryColor,
                    textColor: Colors.white,
                    height: 40,
                  ),
                  const SizedBox(width: 5),
                  CustomButton(
                    width: 100,
                    onPress: () {
                      CustomDialog(
                        context: context,
                        title: "تعریف گروه",
                        height: 360.0,
                        color: Colors.white,
                        textColor: Colora.primaryColor,
                        widget: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                controller: TextEditingController(),
                                text: "عنوان",
                                hintStyle: const TextStyle(color: Colors.white),
                                backgroundColor: Colora.primaryColor,
                              ),
                              const SizedBox(height: 10),
                              RadioListTile(
                                title: const Text(
                                  'نیازمندی',
                                  style: TextStyle(
                                    color:
                                        Colora
                                            .primaryColor, // Change the color to whatever you desire
                                  ),
                                ),
                                groupValue: prerequisite,
                                value: "prereq",
                                onChanged: (value) {
                                  // Handle radio button changes here
                                },
                              ),
                              const Text('هزینه اشتراک'),
                              CustomTextField(
                                controller: TextEditingController(),
                                text: "مبلغ به ریال",
                                hintStyle: const TextStyle(color: Colors.white),
                                backgroundColor: Colora.primaryColor,
                              ),
                              const SizedBox(height: 60),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    onPress: () {
                                      Navigator.pop(context);
                                    },
                                    text: "لغو",
                                    width: 90,
                                    color: Colora.primaryColor,
                                    textColor: Colors.white,
                                  ),
                                  CustomButton(
                                    onPress: () {},
                                    text: "ثبت",
                                    width: 90,
                                    color: Colora.primaryColor,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    text: "افزودن گروه",
                    color: Colora.primaryColor,
                    textColor: Colors.white,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
