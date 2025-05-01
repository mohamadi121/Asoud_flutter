import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/features/market/presentation/blocs/add_product/add_product_bloc.dart';

class ProductPicSection extends StatelessWidget {
  const ProductPicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductState>(
      builder: (context, state) {
        return Container(
          width: Dimensions.width,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.02),
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.06),
          decoration: BoxDecoration(
            color: Colora.scaffold,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.height * 0.01,
                ),
                child: Text(
                  'تصویر محصول : ',
                  style: TextStyle(
                    color: Colora.primaryColor,
                    fontSize: Dimensions.width * 0.035,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'انتخاب عکس برای محصول باعث جذب مشتری می‌شود.',
                  style: TextStyle(
                    color: Colora.primaryColor,
                    fontSize: Dimensions.width * 0.03,
                  ),
                ),
              ),

              //add image
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: Dimensions.width * 0.35,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.01,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height * 0.01,
                    horizontal: Dimensions.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colora.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_rounded,
                          color: Colora.scaffold,
                          size: Dimensions.width * 0.06,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            'افزودن عکس',
                            style: TextStyle(
                              fontSize: Dimensions.width * 0.033,
                              color: Colora.scaffold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //images
              Container(
                width: Dimensions.width,
                height:
                    state.productImages.isEmpty ? 0 : Dimensions.height * 0.1,
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.height * 0.01,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.productImages.length,
                  itemBuilder:
                      (context, index) => Stack(
                        children: [
                          Container(
                            width: Dimensions.width * 0.2,
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colora.primaryColor),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colora.primaryColor,
                                border: Border.all(color: Colora.primaryColor),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.redAccent,
                                size: Dimensions.width * 0.045,
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
