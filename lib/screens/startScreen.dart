import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/screens/products_screen.dart';
import 'package:shaikapp/widgets/buttom_nav_bar.dart';

import '../style.dart';
import 'HomeScreen.dart';
import 'categoryScreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenControlX = Get.put(ScreenControllerX());
    final categoryX = Get.put(CategoryGetX());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(color: AppColor.backgroundcolorgrey,
            onPressed: (){
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
                Center(child: Text('shopbag'),);
            }
          if(screenControlX.screen.value==xScreen.liked)
            {
              return
                Center(child: Text('liked'),);
            }
          if(screenControlX.screen.value==xScreen.profil)
            {
              return
                Center(child: Text('profil'),);
            }
          if(screenControlX.screen.value==xScreen.products)
            {
              return
                ProductsScreen();
            }
          return Center(child: Text('Error'),);
        }),
        bottomNavigationBar: BUttomNvBar(),
    );
  }
}
