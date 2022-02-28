import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/TopListWidget.dart';
import 'package:shaikapp/widgets/carousel.dart';
import 'package:shaikapp/widgets/categors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:shaikapp/widgets/productMini.dart';
class HomeScreen extends StatelessWidget {
  late FirebaseMessaging messaging;
  final screenControlX = Get.put(ScreenControllerX());

  @override
  Widget build(BuildContext context) {
    return
      FadeInLeft(
        duration: Duration(milliseconds: 100),
        child:
        Obx((){
          return
            ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.white,
                    child: CoruselImages()),
                // InkWell(
                //   onTap: ()async{
                //   },
                //  child:
                //      Obx((){
                //        return
                //            Text(Get.find<ProfileX>().user.value.devicetoken);
                //      }),
                // ),

                TopListWidget(
                  titleText: DefText.topSales.tr,
                  list: Get.find<ProductX>().topManSalesbagList.value,
                ),
                TopListWidget(
                  titleText: DefText.topUnisexSales.tr,
                  list: Get.find<ProductX>().topUnisexSalesbagList.value,
                ),
                TopListWidget(
                  titleText: DefText.topWomanSales.tr,
                  list: Get.find<ProductX>().topWomanSalesbagList.value,
                ),
                TopListWidget(
                  titleText: DefText.topManSales.tr,
                  list: Get.find<ProductX>().topManSalesbagList.value,
                ),
                TopListWidget(
                  titleText: DefText.topChildSales.tr,
                  list: Get.find<ProductX>().topChildSalesbagList.value,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  padding: EdgeInsets.all(16),

                  child:
                  Column(
                    children: [
                      AutoSizeText(DefText.Rek0.tr.toUpperCase(),style: AppColor.headlinebluegray.merge(TextStyle()),),
                      Row(
                        children: [
                          Expanded(child: Container()),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16.0),
                           child: Icon(FontAwesomeIcons.award,size: 40,),
                         ),
                          Expanded(flex:5,child: AutoSizeText(DefText.Rek1.tr.toUpperCase(),style: AppColor.headlinebluegray1,maxLines: 1,)),
                          Expanded(child: Container()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16.0),
                           child: Icon(FontAwesomeIcons.hourglassStart,size: 40,),
                         ),
                          Expanded(flex:5,child: AutoSizeText(DefText.Rek2.tr.toUpperCase(),style: AppColor.headlinebluegray1,maxLines: 1)),
                          Expanded(child: Container()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16.0),
                           child: Icon(FontAwesomeIcons.shippingFast,size: 40,),
                         ),
                          Expanded(flex:5,child: AutoSizeText(DefText.Rek3.tr.toUpperCase(),style: AppColor.headlinebluegray1,maxLines: 1)),
                          Expanded(child: Container()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16.0),
                           child: Icon(FontAwesomeIcons.checkCircle,size: 40,),
                         ),
                          Expanded(flex:5,child: AutoSizeText(DefText.Rek4.tr.toUpperCase(),style: AppColor.headlinebluegray1,maxLines: 1)),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
        }),
      );


  }
}
