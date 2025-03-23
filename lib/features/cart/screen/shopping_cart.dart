import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/default_appbar.dart';
import 'package:asood/core/widgets/simple_bot_navbar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool showInvoice = false;
  bool showFinalMessage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colora.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //products
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height * 0.11),

                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => productCart(index),
                    ),

                    SizedBox(height: Dimensions.height * 0.515),

                    //buttons
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colora.primaryColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width * 0.07,
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'بازگشت',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colora.primaryColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width * 0.03,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  showInvoice = true;
                                });
                              },
                              child: const Text(
                                'تکمیل خرید',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SimpleBotNavBar(),
                  ],
                ),
              ),

              const NewAppBar(title: 'سبد خرید‌'),

              // invoice
              if (showInvoice == true) ...[
                Container(
                  width: Dimensions.width,
                  height: Dimensions.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.05,
                    vertical: Dimensions.height * 0.05,
                  ),
                  color: Colora.primaryColor.withOpacity(0.6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colora.scaffold,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height * 0.02,
                      horizontal: Dimensions.width * 0.03,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //header
                          Container(
                            height: Dimensions.height * 0.06,
                            margin: EdgeInsets.only(
                              bottom: Dimensions.height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: Colora.primaryColor,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'فاکتور - ثبت نهایی',
                              style: TextStyle(
                                color: Colora.scaffold,
                                fontSize: 17,
                              ),
                            ),
                          ),

                          //name
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                            ),
                            child: const Text(
                              'گیرنده : محمد رضا محمدی',
                              style: TextStyle(
                                color: Colora.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          //phone
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                            ),
                            child: const Text(
                              'شماره موبایل : ۰۹۱۲۳۹۳۱۷۷۴',
                              style: TextStyle(
                                color: Colora.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          //address
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height * 0.01,
                            ),
                            child: const Text(
                              'آدرس : تهران ، احمد آباد',
                              style: TextStyle(
                                color: Colora.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          //invoice
                          Container(
                            decoration: BoxDecoration(
                              color: Colora.scaffold_,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: Dimensions.height * 0.06,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width * 0.03,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colora.primaryColor,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'نام کالا',
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colora.scaffold_,
                                        endIndent: 10,
                                        indent: 10,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'تعداد',
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colora.scaffold_,
                                        endIndent: 10,
                                        indent: 10,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'قیمت',
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: Colora.scaffold_,
                                        endIndent: 10,
                                        indent: 10,
                                        thickness: 2,
                                      ),
                                      Text(
                                        'میلغ کل',
                                        style: TextStyle(
                                          color: Colora.scaffold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  height: Dimensions.height * 0.06,
                                  alignment: Alignment.center,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'تعمیر دریل',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '۲۰۰.۰۰۰',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '200.000',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Divider(
                                  color: Colora.primaryColor,
                                  indent: 10,
                                  endIndent: 10,
                                ),

                                //price
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        'مبلغ کل       :   ',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        '۲۰۰.۰۰۰ تومان',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //discount
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        'مبلغ تخفیف :   ',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        '۲۰۰.۰۰۰ تومان',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // post price
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        'هزینه کرایه   :   ',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        '۲۰۰.۰۰۰ تومان',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //total
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        'مبلغ نهایی    :   ',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height * 0.01,
                                      ),
                                      child: const Text(
                                        '۲۰۰.۰۰۰ تومان',
                                        style: TextStyle(
                                          color: Colora.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //payment text
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.height * 0.02,
                              ),
                              child: const Text(
                                'شیوه پرداخت :',
                                style: TextStyle(
                                  color: Colora.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          //payment method
                          Container(
                            height: Dimensions.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colora.scaffold_,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width * 0.05,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'نقد',
                                    style: TextStyle(
                                      color: Colora.primaryColor,
                                      fontSize: Dimensions.width * 0.03,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,

                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    fillColor: WidgetStateProperty.all(
                                      Colora.primaryColor,
                                    ),

                                    value:
                                        1, // Assign a value of 1 to this option
                                    groupValue:
                                        '_selectedValue', // Use _selectedValue to track the selected option
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                                      // });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'اینترنتی',
                                    style: TextStyle(
                                      color: Colora.primaryColor,
                                      fontSize: Dimensions.width * 0.03,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,

                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    fillColor: WidgetStateProperty.all(
                                      Colora.primaryColor,
                                    ),

                                    value:
                                        1, // Assign a value of 1 to this option
                                    groupValue:
                                        '_selectedValue', // Use _selectedValue to track the selected option
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                                      // });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'حواله',
                                    style: TextStyle(
                                      color: Colora.primaryColor,
                                      fontSize: Dimensions.width * 0.03,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,

                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    fillColor: WidgetStateProperty.all(
                                      Colora.primaryColor,
                                    ),

                                    value:
                                        1, // Assign a value of 1 to this option
                                    groupValue:
                                        '_selectedValue', // Use _selectedValue to track the selected option
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                                      // });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'چک',
                                    style: TextStyle(
                                      color: Colora.primaryColor,
                                      fontSize: Dimensions.width * 0.03,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,

                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    fillColor: WidgetStateProperty.all(
                                      Colora.primaryColor,
                                    ),

                                    value:
                                        1, // Assign a value of 1 to this option
                                    groupValue:
                                        '_selectedValue', // Use _selectedValue to track the selected option
                                    onChanged: (value) {
                                      // setState(() {
                                      //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                                      // });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: Dimensions.height * 0.14),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //cancel
                              Container(
                                width: Dimensions.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colora.primaryColor,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showInvoice = false;
                                    });
                                  },
                                  child: const Text(
                                    'انصراف',
                                    style: TextStyle(
                                      color: Colora.scaffold_,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: Dimensions.width * 0.03),

                              //confirm
                              Container(
                                width: Dimensions.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colora.primaryColor,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showFinalMessage = true;
                                    });
                                  },
                                  child: const Text(
                                    'ثبت نهایی',
                                    style: TextStyle(
                                      color: Colora.scaffold_,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],

              if (showFinalMessage == true) ...[
                Container(
                  width: Dimensions.width,
                  height: Dimensions.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.05,
                    vertical: Dimensions.height * 0.33,
                  ),
                  color: Colora.primaryColor.withOpacity(0.7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colora.scaffold,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height * 0.02,
                      horizontal: Dimensions.width * 0.03,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'تایید نهایی',
                          style: TextStyle(
                            color: Colora.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const Divider(color: Colora.primaryColor, thickness: 2),
                        const Text(
                          'خریدار گرامی ، سفارش شما با موفقیت تایید گردید . شما می‌توانید فرایند سفارش خود را از پیگیری خرید ،‌مشاهده نمائید',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5,
                            color: Colora.primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height * 0.02,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width * 0.04,
                          ),
                          decoration: BoxDecoration(
                            color: Colora.primaryColor,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                showInvoice = false;
                                showFinalMessage = false;
                              });
                            },
                            child: Text(
                              'رویت شد',
                              style: TextStyle(
                                color: Colora.scaffold,
                                fontSize: Dimensions.width * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget productCart(index) {
    return Container(
      width: Dimensions.width * 0.9,
      height: Dimensions.height * 0.15,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.height * 0.005,
        horizontal: Dimensions.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colora.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          //image
          SizedBox(
            width: Dimensions.width * 0.32,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    child: Container(color: Colors.redAccent),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  width: Dimensions.width * 0.32,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Container(
                        width: Dimensions.width * 0.25,
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colora.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: Colora.scaffold,
                              size: 20,
                            ),
                            Text(
                              'حذف کردن',
                              style: TextStyle(
                                color: Colora.scaffold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.width * 0.6,
            child: Column(
              children: [
                //title
                Container(
                  width: Dimensions.width * 0.6,
                  height: Dimensions.height * 0.06,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.03,
                    vertical: Dimensions.height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colora.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'محصول شماره ${index + 1}',
                    style: TextStyle(
                      color: Colora.scaffold,
                      fontSize: Dimensions.width * 0.03,
                    ),
                  ),
                ),

                //price and count
                Container(
                  width: Dimensions.width * 0.7,
                  height: Dimensions.height * 0.07,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width * 0.03,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '120.000 تومان',
                        style: TextStyle(
                          color: Colora.scaffold,
                          fontSize: Dimensions.width * 0.03,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colora.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: Colora.scaffold,
                                  size: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colora.scaffold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.remove,
                                  color: Colora.scaffold,
                                  size: 15,
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
        ],
      ),
    );
  }

  Widget cartInvoice() {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width * 0.05,
        vertical: Dimensions.height * 0.05,
      ),
      color: Colora.primaryColor.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colora.scaffold,
          borderRadius: BorderRadius.circular(26),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height * 0.02,
          horizontal: Dimensions.width * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Container(
                height: Dimensions.height * 0.06,
                margin: EdgeInsets.only(bottom: Dimensions.height * 0.01),
                decoration: BoxDecoration(
                  color: Colora.primaryColor,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'فاکتور - ثبت نهایی',
                  style: TextStyle(color: Colora.scaffold, fontSize: 17),
                ),
              ),

              //name
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height * 0.01,
                ),
                child: const Text(
                  'گیرنده : محمد رضا محمدی',
                  style: TextStyle(color: Colora.primaryColor, fontSize: 16),
                ),
              ),

              //phone
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height * 0.01,
                ),
                child: const Text(
                  'شماره موبایل : ۰۹۱۲۳۹۳۱۷۷۴',
                  style: TextStyle(color: Colora.primaryColor, fontSize: 16),
                ),
              ),

              //address
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height * 0.01,
                ),
                child: const Text(
                  'آدرس : تهران ، احمد آباد',
                  style: TextStyle(color: Colora.primaryColor, fontSize: 16),
                ),
              ),

              //invoice
              Container(
                decoration: BoxDecoration(
                  color: Colora.scaffold_,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.height * 0.06,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: Colora.primaryColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'نام کالا',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 14,
                            ),
                          ),
                          VerticalDivider(
                            color: Colora.scaffold_,
                            endIndent: 10,
                            indent: 10,
                            thickness: 2,
                          ),
                          Text(
                            'تعداد',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 14,
                            ),
                          ),
                          VerticalDivider(
                            color: Colora.scaffold_,
                            endIndent: 10,
                            indent: 10,
                            thickness: 2,
                          ),
                          Text(
                            'قیمت',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 14,
                            ),
                          ),
                          VerticalDivider(
                            color: Colora.scaffold_,
                            endIndent: 10,
                            indent: 10,
                            thickness: 2,
                          ),
                          Text(
                            'میلغ کل',
                            style: TextStyle(
                              color: Colora.scaffold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: Dimensions.height * 0.06,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'تعمیر دریل',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '۲۰۰.۰۰۰',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '200.000',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      color: Colora.primaryColor,
                      indent: 10,
                      endIndent: 10,
                    ),

                    //price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            'مبلغ کل       :   ',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            '۲۰۰.۰۰۰ تومان',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //discount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            'مبلغ تخفیف :   ',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            '۲۰۰.۰۰۰ تومان',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // post price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            'هزینه کرایه   :   ',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            '۲۰۰.۰۰۰ تومان',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            'مبلغ نهایی    :   ',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height * 0.01,
                          ),
                          child: const Text(
                            '۲۰۰.۰۰۰ تومان',
                            style: TextStyle(
                              color: Colora.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //payment text
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.02,
                  ),
                  child: const Text(
                    'شیوه پرداخت :',
                    style: TextStyle(
                      color: Colora.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              //payment method
              Container(
                height: Dimensions.height * 0.06,
                decoration: BoxDecoration(
                  color: Colora.scaffold_,
                  borderRadius: BorderRadius.circular(26),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'نقد',
                        style: TextStyle(
                          color: Colora.primaryColor,
                          fontSize: Dimensions.width * 0.03,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        controlAffinity: ListTileControlAffinity.trailing,

                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        fillColor: WidgetStateProperty.all(
                          Colora.primaryColor,
                        ),

                        value: 1, // Assign a value of 1 to this option
                        groupValue:
                            '_selectedValue', // Use _selectedValue to track the selected option
                        onChanged: (value) {
                          // setState(() {
                          //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                          // });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'اینترنتی',
                        style: TextStyle(
                          color: Colora.primaryColor,
                          fontSize: Dimensions.width * 0.03,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        controlAffinity: ListTileControlAffinity.trailing,

                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        fillColor: WidgetStateProperty.all(
                          Colora.primaryColor,
                        ),

                        value: 1, // Assign a value of 1 to this option
                        groupValue:
                            '_selectedValue', // Use _selectedValue to track the selected option
                        onChanged: (value) {
                          // setState(() {
                          //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                          // });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'حواله',
                        style: TextStyle(
                          color: Colora.primaryColor,
                          fontSize: Dimensions.width * 0.03,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        controlAffinity: ListTileControlAffinity.trailing,

                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        fillColor: WidgetStateProperty.all(
                          Colora.primaryColor,
                        ),

                        value: 1, // Assign a value of 1 to this option
                        groupValue:
                            '_selectedValue', // Use _selectedValue to track the selected option
                        onChanged: (value) {
                          // setState(() {
                          //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                          // });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'چک',
                        style: TextStyle(
                          color: Colora.primaryColor,
                          fontSize: Dimensions.width * 0.03,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        controlAffinity: ListTileControlAffinity.trailing,

                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        fillColor: WidgetStateProperty.all(
                          Colora.primaryColor,
                        ),

                        value: 1, // Assign a value of 1 to this option
                        groupValue:
                            '_selectedValue', // Use _selectedValue to track the selected option
                        onChanged: (value) {
                          // setState(() {
                          //   // _selectedValue = value!; // Update _selectedValue when option 1 is selected
                          // });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Dimensions.height * 0.14),

              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: Dimensions.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colora.primaryColor,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              showInvoice = false;
                            });
                          },
                          child: const Text(
                            'انصراف',
                            style: TextStyle(
                              color: Colora.scaffold_,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width * 0.03),
                      Container(
                        width: Dimensions.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colora.primaryColor,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            'ثبت نهایی',
                            style: TextStyle(
                              color: Colora.scaffold_,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
