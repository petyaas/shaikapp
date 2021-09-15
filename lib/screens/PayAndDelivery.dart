import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/style.dart';

import '../consts.dart';
class PayAndDelivery extends StatelessWidget {
  const PayAndDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DefText.paydelivery.tr,style: AppColor.headlinebluegray1,),
        ),
        body: ListView(
          children: [
            _listen(text: DefText.payDelivery1.tr,),
            _listen(text: DefText.payDelivery2.tr,),
            _listen(text: DefText.payDelivery3.tr,),
            _listen(text: DefText.payDelivery4.tr,),
            _listen(text: DefText.payDelivery5.tr,),
            _listen(text: DefText.payDelivery6.tr,),
            _listen(text: DefText.payDelivery7.tr,),
            _listen(text: DefText.payDelivery8.tr,),
          ],
        )
    );
  }
}

class _listen extends StatelessWidget {
  final String text;
  _listen({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.exclamation,size: 15,),
          ),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
