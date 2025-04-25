import 'package:asood/core/constants/constants.dart';
import 'package:asood/features/market/presentation/blocs/add_product/add_product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({super.key});

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  final TextEditingController price = TextEditingController();
  @override
  void dispose() {
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductState>(
      builder: (context, state) {
        return Container(
          width: Dimensions.width,
          height: Dimensions.height * 0.06,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.02),
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.06),
          decoration: BoxDecoration(
            color: Colora.scaffold,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قیمت فروش : ',
                style: TextStyle(
                  color: Colora.primaryColor,
                  fontSize: Dimensions.width * 0.035,
                ),
              ),
              if (state.productPriceEnable) ...[
                Container(
                  width: Dimensions.width * 0.35,
                  padding: EdgeInsets.only(bottom: Dimensions.height * 0.0),
                  child: TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colora.primaryColor),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colora.primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colora.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              CupertinoSwitch(
                activeTrackColor: Colora.primaryColor,
                value: state.productPriceEnable,
                onChanged: (value) {
                  context.read<AddProductBloc>().add(
                    ProductPriceStockEvent(
                      priceEnable: !state.productPriceEnable,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
