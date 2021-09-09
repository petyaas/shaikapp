import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';
  class ButtonCustom extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  TextAlign? align;
  Color? borderColor;
  Widget? actions;

  ButtonCustom({required this.icon,this.actions, required this.text,required this.onTap,this.align,this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      height: 50,
      child:
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(width: 50, child: Icon(icon,color: AppColor.backgroundcolorgrey,)),
            Expanded(child: Text(text,style: AppColor.headlinebluegray,textAlign: align != null?align:TextAlign.start)),
            if(actions!=null) actions!,
          ],
        ),
      ),
    );
  }
}
