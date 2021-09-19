import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import '../style.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
class BUttomNvBar extends StatefulWidget {
  const BUttomNvBar({Key? key}) : super(key: key);
  @override
  _BUttomNvBarState createState() => _BUttomNvBarState();
}

class _BUttomNvBarState extends State<BUttomNvBar> {
  final screenControlX = Get.put(ScreenControllerX());
  final categoryX = Get.put(CategoryGetX());
  final productX = Get.put(ProductX());
late String _bagList;
late String _likeList;

  @override
  Widget build(BuildContext context) {
    return
    Obx((){
      if(productX.bagList.value.length!=0)
        {_bagList=productX.bagList.value.length.toString();}
      else{_bagList='';}
      if(productX.likeList.value.length!=0)
        {_likeList=productX.likeList.value.length.toString();}
      else{_likeList='';}



      return
        BottomNavyBar(
          iconSize: 20,
          selectedIndex: screenControlX.screenIndex.value,
          onItemSelected: (index) {
            // if(index==1){categoryX.getCategory();}

            screenControlX.setIndex(index);

          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Center(child: Text(DefText.homePage.tr,style: AppColor.bottomNavBarText,)),
                icon: Icon(FontAwesomeIcons.home,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Center(child: Text(DefText.categories.tr,style: AppColor.bottomNavBarText,)),
                icon: Icon(FontAwesomeIcons.th,color: AppColor.backgroundcolorgrey,)
            ),
            BottomNavyBarItem(
                title: Center(child: Text(DefText.shoppingBag.tr,style: AppColor.bottomNavBarText,)),
                icon:
                        Badge(
                            padding: EdgeInsets.all(4),
                            badgeContent: Text(_bagList.toString(),style: AppColor.badgewhite,),
                            child: Icon(FontAwesomeIcons.shoppingBag,color: AppColor.backgroundcolorgrey,))
            ),
            BottomNavyBarItem(
                title: Center(child: Text(DefText.favorite.tr,style: AppColor.bottomNavBarText,)),
                icon:
                      Badge(
                          padding: EdgeInsets.all(4),
                          badgeContent: Text(_likeList.toString(),style: AppColor.badgewhite,),
                          child: Icon(FontAwesomeIcons.heart,color: AppColor.backgroundcolorgrey,)
                      ),

            ),
            BottomNavyBarItem(
                title: Center(child: Text(DefText.profile.tr,style: AppColor.bottomNavBarText,)),
                icon: Icon(FontAwesomeIcons.user,color: AppColor.backgroundcolorgrey,)
            ),
          ],
        );
    });
  }
}
