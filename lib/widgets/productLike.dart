import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/productX.dart';

import '../style.dart';
class ProductLike extends StatelessWidget {
VoidCallback? onTap;
bool isLiked;

ProductLike({this.onTap,required this.isLiked});
  @override
  Widget build(BuildContext context) {

    IconData _icon;
    Color _color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if(isLiked==true)
              IconButton(
                onPressed: onTap,
                icon: Icon(FontAwesomeIcons.solidHeart),
                color: AppColor.red,),
        if(isLiked==false)
          IconButton(
            onPressed: onTap,
            icon: Icon(FontAwesomeIcons.heart),
            color: AppColor.backgroundcolorgrey,),
      ],
    );
  }
}
