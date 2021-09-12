import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/screens/EditProfilePage.dart';

import 'package:shaikapp/screens/SignInPage.dart';
import 'package:shaikapp/services/LangSelector.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/ButtonCustom.dart';
import 'package:shaikapp/widgets/ProfileView.dart';

import '../consts.dart';
class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final profileX = Get.put(ProfileX());
    final langSelectorX = Get.put(LangSelector());

    return FadeInDown(
      duration: Duration(milliseconds: 100),
      child: Column(
        children: [
          Obx(()
          {
            print('usUserLoad'+profileX.isUserLoad.value.toString());
           if(profileX.isUserLoad.value==true)
             {
               return  ProfileView(profile: profileX.user.value, onTap: () {Get.to(EDitProfilePage());},);
             }
           if(profileX.isUserLoad.value==false)
             {
               return  Container();
             }
            return Text('adsa');
          }
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                // ButtonCustom(text: 'SignIn', icon: FontAwesomeIcons.signInAlt,
                //   onTap: () {
                //   },),
                // ButtonCustom(text: 'SignOut', icon: FontAwesomeIcons.signOutAlt, onTap: () {  },),
                Obx((){
                  if(profileX.isUserLoad.value==false)
                  {
                    return
                      ButtonCustom(text: DefText.signin.tr, icon: FontAwesomeIcons.signInAlt,
                      onTap: () {
                        Get.to(SignInPage());
                        // profileX.sendSMS('+99362497266');
                      },);
                }

                  return Container();

                }),
                ButtonCustom(text: DefText.delivered.tr, icon: FontAwesomeIcons.truck,
                  onTap: () {
                  print('deliver');
                    // profileX.sendSMS('+99362497266');

                  },),

                ButtonCustom(text: DefText.language.tr, icon: FontAwesomeIcons.language,
                  onTap: () {
                  if(langSelectorX.istklang.value)
                    {langSelectorX.setlang(false);}else{langSelectorX.setlang(true);}

                  },
                  actions: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 20,
                          child: Image(image: AssetImage('assets/icons/tkflag.png'))
                      ),
                      Switch(
                        value: langSelectorX.istklang.value,
                        onChanged: (value) {
                          langSelectorX.setlang(value);
                        },
                        activeTrackColor: AppColor.backgroundLightcolor,
                        activeColor: AppColor.laghtBlueGray,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 20,
                          child: Image(image: AssetImage('assets/icons/ruflag.png'))
                      ),

                    ],
                  ),
                ),

                ButtonCustom(text: DefText.paydelivery.tr, icon: FontAwesomeIcons.bars, onTap: () {
                  print('pat');

                },),
                ButtonCustom(text: DefText.sendemail.tr, icon: FontAwesomeIcons.envelope, onTap: () {  },),
                Obx((){
                  if(profileX.isUserLoad.value==true)
                  {
                    return
                      ButtonCustom(text: DefText.signout.tr, icon: FontAwesomeIcons.signOutAlt, onTap: () {
                        Get.defaultDialog(
                          textConfirm: DefText.yes.tr,
                          textCancel: DefText.cancel.tr,
                          buttonColor: AppColor.backgroundcolor,
                          backgroundColor: AppColor.backgroundcolor,
                          onConfirm: () {
                            profileX.removeProfile();
                            Get.back();
                          },
                          title: DefText.alert.tr,
                          titleStyle: AppColor.headlinewhitelight,
                          content:
                            Text(DefText.signoutalert.tr,style: AppColor.headlinewhitelight1,)
                        );

                      },);
                  }

                  return Container();

                }),
                ButtonCustom(text: DefText.info.tr, icon: FontAwesomeIcons.infoCircle, onTap: () {  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
