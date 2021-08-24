import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import '../style.dart';
import 'package:get/get.dart';
class BUttomNvBar extends StatefulWidget {
  const BUttomNvBar({Key? key}) : super(key: key);
  @override
  _BUttomNvBarState createState() => _BUttomNvBarState();
}

class _BUttomNvBarState extends State<BUttomNvBar> {
  final screenControlX = Get.put(ScreenControllerX());
  final categoryX = Get.put(CategoryGetX());

  @override
  Widget build(BuildContext context) {
    return
    Obx((){
      return
        BottomNavyBar(
          iconSize: 20,
          selectedIndex: screenControlX.screenIndex.value,
          onItemSelected: (index) {
            if(index==1){categoryX.getCategory();}

            screenControlX.setIndex(index);

          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text(DefText.homePage.tr,style: AppColor.bottomNavBarText,),
                icon: Icon(FontAwesomeIcons.home,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Text(DefText.categories.tr,style: AppColor.bottomNavBarText,),
                icon: Icon(FontAwesomeIcons.th,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Text(DefText.shoppingBag.tr,style: AppColor.bottomNavBarText,),
                icon: Icon(FontAwesomeIcons.shoppingBag,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Text(DefText.favorite.tr,style: AppColor.bottomNavBarText,),
                icon: Icon(FontAwesomeIcons.heart,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Text(DefText.profile.tr,style: AppColor.bottomNavBarText,),
                icon: Icon(FontAwesomeIcons.user,color: AppColor.backgroundcolorgrey,)
            ),
          ],
        );
    });
  }
}
