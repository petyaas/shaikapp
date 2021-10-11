import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';

import '../consts.dart';
import '../style.dart';
import 'CustomTextField.dart';
import 'categors.dart';
class OrderWidget extends StatelessWidget {

  final productX = Get.put(ProductX());
  final profileX = Get.put(ProfileX());

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _addressController=new TextEditingController();
  @override
  Widget build(BuildContext context) {

    _nameController.text=profileX.user.value.client_name;
    _phoneController.text=profileX.user.value.phone;
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      title: Row(
        children: [
          Obx((){
            return
              AutoSizeText(
                DefText.totalPriceBag.tr+'-'+productX.totalPrice.value.toString()+' TMT',style: AppColor.headlinebluegray,
                minFontSize: 7,
                maxLines: 1,
                maxFontSize: 16,
              );
          }),
        ],
      ),
      subtitle: Row(
        children: [
          if(productX.totalPrice.value<150)
            Text(DefText.priceIsSmall.tr),
          if(productX.totalPrice.value>=150)
            Text(DefText.priceIsGood.tr),
        ],
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.truck,color: AppColor.backgroundcolorgrey,),
        ],
      ),
      textColor: AppColor.grey,
      collapsedTextColor: AppColor.red,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            controller: _nameController,
            hint: DefText.name.tr,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            controller: _phoneController,
            hint: DefText.phone.tr,
          ),
        ),
      ],
    );
  }
}
