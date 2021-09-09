import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:shaikapp/models/clientProfile.dart';

import '../style.dart';
class ProfileView extends StatelessWidget {
  ClientProfile profile;
  VoidCallback onTap;
  ProfileView({required this.profile,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.all(16),
        // padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 70, width: 70,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: AppColor.backgroundcolorgrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Icon(FontAwesomeIcons.user,size: 30,color: AppColor.backgroundcolorgrey,),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       width: 1,
                      //       color: AppColor.backgroundcolorgrey,
                      //     ),
                      //     borderRadius: BorderRadius.all(Radius.circular(10))
                      // ),
                      width: double.infinity,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      child: Center(child:
                      AutoSizeText(
                        profile.client_name,style: AppColor.headlinebluegray,textAlign: TextAlign.center,
                        minFontSize: 8,
                        maxLines: 1,
                      )
                      )
                  ),
                  Divider(color: AppColor.backgroundcolor,),
                  Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       width: 1,
                      //       color: AppColor.backgroundcolorgrey,
                      //     ),
                      //     borderRadius: BorderRadius.all(Radius.circular(10))
                      // ),
                      width: double.infinity,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      child: Center(
                          child:
                          AutoSizeText(
                            profile.phone,
                            style: AppColor.headlinebluegray,
                            textAlign: TextAlign.center,
                            minFontSize: 8,maxLines: 1,
                          ))),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
