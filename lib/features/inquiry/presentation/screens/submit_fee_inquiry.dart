import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/core/widgets/custom_textfield.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:asood/core/widgets/radio_button.dart';
import 'package:asood/features/inquiry/presentation/blocs/inquiry_bloc.dart';

@RoutePage()
class SubmitFeeInquiryScreen extends StatefulWidget {
  const SubmitFeeInquiryScreen({super.key});

  @override
  State<SubmitFeeInquiryScreen> createState() => _SubmitFeeInquiryScreenState();
}

class _SubmitFeeInquiryScreenState extends State<SubmitFeeInquiryScreen> {
  String dropdownValue = 'انتخاب دسته‌بندی';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _detailsController.dispose();
    _amountController.dispose();
    _unitController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<InquiryBloc>(context);

    return Scaffold(
      appBar: DefaultAppBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: Dimensions.width * 0.9,
              margin: const EdgeInsets.all(20),
              child: BlocConsumer<InquiryBloc, InquiryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [_buildRadioButtons(bloc), _buildForm(bloc)],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      // bottomNavigationBar: SimpleBotNavBar(),
    );
  }

  Widget _buildRadioButtons(InquiryBloc bloc) {
    return IntrinsicWidth(
      child: Container(
        height: 80,
        // width: 400,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colora.primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              radioButton(
                title: 'محصول',
                groupValue: bloc.state.inquiryType,
                value: 'product',
                onChanged: (value) {
                  bloc.add(InquiryTypeSwitch(value!));
                },
              ),
              radioButton(
                title: 'خدمت',
                groupValue: bloc.state.inquiryType,
                value: 'service',
                onChanged: (value) {
                  bloc.add(InquiryTypeSwitch(value!));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(InquiryBloc bloc) {
    return Container(
      width: Dimensions.width * 0.9,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colora.primaryColor,
      ),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(text: bloc.state.inquiryTitle),
            text: "نام کالای مورد نیاز",
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: TextEditingController(
              text: bloc.state.inquiryDescription,
            ),
            text: "توضیحات",
            maxLine: 5,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: TextEditingController(text: bloc.state.inquiryDetails),
            text: "مشخصات",
            maxLine: 5,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.white),
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items:
                    <String>[
                      'انتخاب دسته‌بندی',
                      'Option 2',
                      'Option 3',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                      text: bloc.state.inquiryAmount.toString(),
                    ),
                    text: "مقدار",
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(
                      text: bloc.state.inquiryUnit,
                    ),
                    text: "واحد",
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(
                      text: bloc.state.inquiryName,
                    ),
                    text: "نام تجاری",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text("تصویر کالا"),
                const Text(
                  "عکس مورد نظر خود را از این بخش میتوانید بارگزاری نمایید:",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 50,
                      child: CustomButton(onPress: () {}, text: "افزودن"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                margin: const EdgeInsets.all(10.0),
                child: CustomButton(
                  onPress: () {},
                  text: "ثبت",
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
