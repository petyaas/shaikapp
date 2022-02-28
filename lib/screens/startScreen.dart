import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/screens/products_screen.dart';
import 'package:shaikapp/services/LangSelector.dart';
import 'package:shaikapp/widgets/buttom_nav_bar.dart';

import '../style.dart';
import 'BagScreen.dart';
import 'HomeScreen.dart';
import 'ProfilsScreen.dart';
import 'categoryScreen.dart';
import 'likedScreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenControlX = Get.put(ScreenControllerX());
    final categoryX = Get.put(CategoryGetX());
    final profileX = Get.put(ProfileX());
    final langSelectorX = Get.put(LangSelector());


    return WillPopScope(
      onWillPop: () async{
        if((screenControlX.screenIndex.value!=0)&&(screenControlX.screenIndex.value!=5))
          {screenControlX.setIndex(0);
          return false;
          }
        return true;
      },      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(color: AppColor.backgroundcolorgrey,
              onPressed: ()async{
                const number = '+99362329777'; //set the number here
                bool? res = await FlutterPhoneDirectCaller.callNumber(number);
              },
              icon: FaIcon(FontAwesomeIcons.phone),
              iconSize: 24,),
            IconButton(color: AppColor.backgroundcolorgrey,
              onPressed: (){
                //GetData().getSliderLIst();
              },
              icon: FaIcon(FontAwesomeIcons.search),
              iconSize: 24,),
          ],
          title: Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SvgPicture.asset(
                'assets/logos/shaik.svg',
                semanticsLabel: 'Acme Logo'
            ),
          ),
        ),
          body: Obx((){
            if(screenControlX.screen.value==xScreen.homepage)
              {
                return
                  HomeScreen();
              }
            if(screenControlX.screen.value==xScreen.category)
              {
                return
                  CategoryScreen();
              }
            if(screenControlX.screen.value==xScreen.shopbag)
              {
                return
                  BagScreen();
              }
            if(screenControlX.screen.value==xScreen.liked)
              {
                return
                  LikedScreen();
              }
            if(screenControlX.screen.value==xScreen.profil)
              {
                return
                  ProfileScreen();
              }
            if(screenControlX.screen.value==xScreen.products)
              {
                return
                  ProductsScreen();
              }
            return Center(child: Text('Error'),);
          }),
          bottomNavigationBar: BUttomNvBar(),
      ),
    );
  }
}
