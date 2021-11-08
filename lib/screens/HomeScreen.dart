import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/widgets/carousel.dart';
import 'package:shaikapp/widgets/categors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  late FirebaseMessaging messaging;
  final screenControlX = Get.put(ScreenControllerX());

  @override
  Widget build(BuildContext context) {
    return
      FadeInLeft(
        duration: Duration(milliseconds: 100),
        child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                    child: CoruselImages()),
                InkWell(
                  onTap: ()async{
                  //   messaging = FirebaseMessaging.instance;
                  //  String ss='';
                  //
                  //   print('gettoken');
                  //  ss=(await messaging.getToken())!;
                  // print(ss);
                  //   messaging.getToken().then((value){
                  //     print('gettoken111');
                  //     print(value);
                  //   });
                  },
                 child:
                     Obx((){
                       return
                           Text(Get.find<ProfileX>().user.value.devicetoken);
                     }),
                ),
              ],
            ),
      );


  }
}
