import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_dialog.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  bool switchValue = false;
  String prerequisite = "";
  String dropdownValue = 'انتخاب گروه';

  @override
  Widget build(BuildContext context) {
    final buttonTexts = [
      "فروشگاه لوازم الکترونیکی",
      "فروشگاه مد و پوشاک",
      "فروشگاه لوازم منزل",
      "فروشگاه لوازم یدکی",
      "فروشگاه بهداشتی و آرایشی",
      "فروشگاه لوازم تحریر و کتابفروشی",
      "فروشگاه الکتریکی و لوازم صنعتی",
      "فروشگاه ابزار آلات",
      "فروشگاه لوازم ساختمانی و تاسیساتی",
      "فروشگاه مواد خوراکی و آشامیدنی",
    ];

    return Column(
      children: [
        Container(
          width: Dimensions.width,
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
                      title: "تعریف دسته",
                      height: 420.0,
                      color: Colors.white,
                      textColor: Colora.primaryColor,
                      widget: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items:
                                  <String>[
                                    'انتخاب گروه',
                                    'Option 2',
                                    'Option 3',
                                    'Option 4',
                                  ].map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                            const SizedBox(height: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  text: "افزودن دسته",
                  color: Colora.primaryColor,
                  textColor: Colors.white,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
