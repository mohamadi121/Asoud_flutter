import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_dialog.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddSubCategory extends StatefulWidget {
  const AddSubCategory({super.key});

  @override
  State<AddSubCategory> createState() => _AddSubCategoryState();
}

class _AddSubCategoryState extends State<AddSubCategory> {
  bool switchValue = false;
  String prerequisite = "";
  String dropdownValue = 'انتخاب دسته';

  @override
  Widget build(BuildContext context) {
    final buttonTexts = [
      "متخصص قلب و عروق",
      "متخصص طب سنتی",
      "متخصص مغز و اعصاب",
      "متخصص تغذیه",
      "متخصص جراح عمومی",
      "متخصص پوست و مو",
    ];

    return Column(
      children: [
        Container(
          width: Dimensions.width,
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
                      title: "تعریف زیر دسته",
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
                                    'انتخاب دسته',
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
                  text: "افزودن زیر دسته",
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
