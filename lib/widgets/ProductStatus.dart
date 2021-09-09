import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:get/get.dart';

import '../style.dart';
class ProductStatus extends StatelessWidget {
  String status;
  VoidCallback? likePress;
  ProductStatus({required this.status,this.likePress});
  @override
  Widget build(BuildContext context) {
    final productX = Get.put(ProductX());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(status!="OLD")  Container(
          margin: EdgeInsets.all(10),
          height: 30, width: 80,
          decoration: BoxDecoration(
            color: Colors.green[800],
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: AppColor.productshadow.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(status,style: AppColor.productStatus,),
          ),
        ),
        if(status=="OLD")  Container(
          margin: EdgeInsets.all(10),
          height: 30, width: 80,
          child: Container(),
        ),

      ],
    );
  }
}
