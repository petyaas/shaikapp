import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/models/products.dart';

import '../consts.dart';
import '../style.dart';
class BagButton extends StatelessWidget {
  Products product;
  BagButton({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('daasa');
      },
      child:
      Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.productprice,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 40,
        child: Center(
          child: Text(
            DefText.addToBag.tr,
            style: AppColor.headlinewhitebol2,

          ),
        ),
      ),
    );
  }
}
