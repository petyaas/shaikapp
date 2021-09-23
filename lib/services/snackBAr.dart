import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/style.dart';
void ShowSnackBar(String title,String massage) async{
  return Get.snackbar(
    title,
    massage,
    colorText: AppColor.white,
    icon: Icon(FontAwesomeIcons.exclamationCircle,color: AppColor.white,),
    backgroundColor: AppColor.backgroundcolorgrey,
    // icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}
