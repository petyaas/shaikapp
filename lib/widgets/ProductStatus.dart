import 'package:flutter/material.dart';

import '../style.dart';
class ProductStatus extends StatelessWidget {
  String status;
  ProductStatus({required this.status});
  @override
  Widget build(BuildContext context) {
    var product;
    return Container(
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
    );
  }
}
