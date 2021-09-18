import 'package:flutter/material.dart';

import '../style.dart';
class IconMessage extends StatelessWidget {
final IconData? icon;
final String text;
IconMessage({this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon,size: 60,color: AppColor.backgroundLightcolor,),
          ),
          Text(text),
        ],
      ),
    );

  }
}
