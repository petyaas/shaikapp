import 'dart:ffi';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/SignInGetX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/screens/HomeScreen.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/ButtonCustom.dart';
import 'package:shaikapp/widgets/CustomTextField.dart';
import 'package:telephony/telephony.dart';

import '../consts.dart';
class SignInPage extends StatelessWidget {
  // final profileX = Get.put(ProfileX());
  final SignInX = Get.put(SignInGetX());
  final telephony = Telephony.instance;

  bool _isWaitinSMS=false;
TextEditingController _controller=new TextEditingController();
TextEditingController _codecontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SignInX.status.value=xSignIn.enternumber;

    telephony.requestPhoneAndSmsPermissions;

    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          String body=message.body ?? "Error";

          if((body!='Error')&&(body.indexOf('SHAIK verification code-')!=-1))
            {
              body=body.substring(body.indexOf('-')+1,body.length);
              _codecontroller.text=body;
              if(_codecontroller.text.length==6)
              {
                SignInX.VerifyCode('+993'+_controller.text, _codecontroller.text);
              }
            }
          print('incomSMS='+body);
        },
        listenInBackground: false
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(DefText.signin,style: AppColor.headlinebluegray,),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Obx((){
                if(SignInX.status.value==xSignIn.enternumber)
                  {
                    return
                      EnterPhone(controller: _controller,
                        onTap: () {
                          if(_controller.text.length==8)
                          {
                            SignInX.sendSMS('+993'+_controller.text);
                            _codecontroller.text='';
                            SignInX.status.value=xSignIn.entercode;
                          }
                        },);
                  }
                if(SignInX.status.value==xSignIn.entercode)
                  {
                    return
                      EnterCode(controller: _codecontroller,
                        onTap: () {
                          if(_codecontroller.text.length==6)
                          {
                            SignInX.VerifyCode('+993'+_controller.text, _codecontroller.text);
                          }
                        }, onCountDown: () { SignInX.status.value=xSignIn.enternumber;_controller.text=''; }, timer: 60, phone: '+993'+_controller.text,);
                  }

                if(SignInX.status.value==xSignIn.loadign)
                  {
                    return
                      Center(child: CircularProgressIndicator());
                  }

                if(SignInX.status.value==xSignIn.completed)
                  {
                    // Get.back();
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('registred',style: AppColor.headlinebluegray,),
                              ),
                            ],
                          ),

                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              child: ButtonCustom(
                                text: 'registred',align: TextAlign.center, icon: FontAwesomeIcons.userCheck,
                                onTap: (){Get.back();},                ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    );

                  }

                return Text('Some Error...');
              }),
              // EnterCode(onTap: (){}, controller: _codecontroller),
            ],
          ),
        ],
      ),
    );
  }
}

class CountDown extends StatelessWidget {
  final int timer;
  VoidCallback OnComplete;
  CountDown({required this.timer,required this.OnComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: AppColor.backgroundcolorgrey,
          border: Border.all(
            // color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_outlined,color: Colors.white,size: 20,),
          CircularCountDownTimer(
            duration: timer,
            initialDuration: 0,
            controller: CountDownController(),
            width: 35,
            height: 35,
            ringColor: Colors.transparent,
            ringGradient: null,
            fillColor: Colors.transparent,
            fillGradient: null,
            backgroundColor: Colors.transparent,
            backgroundGradient: null,
            strokeWidth: 0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.MM_SS,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              print('Countdown Started');
            },
            onComplete: OnComplete,
          ),
        ],
      ),
    );
  }
}


class EnterCode extends StatelessWidget {

  final TextEditingController controller;
  String phone;
  VoidCallback onTap;
  VoidCallback onCountDown;
  int timer;
  EnterCode({required this.onTap,required this.phone,required this.controller,required this.timer,required this.onCountDown});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountDown(OnComplete: onCountDown, timer: timer,),
              Container(margin: EdgeInsets.all(10), width: double.infinity,child: Text(phone+' '+DefText.entersendcode.tr,style: AppColor.headlinegreylight,textAlign: TextAlign.center,)),
              Container(width: double.infinity,child: Text(DefText.entercode.tr,style: AppColor.headlinebluegray,textAlign: TextAlign.right,)),
              CustomTextField(
                controller: controller,
                fomratter: [MaskedTextInputFormatter(
                    mask: 'xxxxxxxx', separator: ''),],
                keybord: TextInputType.number,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(),),
            Expanded(
              child: ButtonCustom(
                text: DefText.checkcode.tr,align: TextAlign.center, icon: FontAwesomeIcons.check,
                onTap: onTap,                ),
            ),
            Expanded(child: Container(),),
          ],
        ),
      ],
    );
  }
}
class EnterPhone extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onTap;
  EnterPhone({required this.onTap,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 250,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: double.infinity,child: Text(DefText.hassendsms.tr,style: AppColor.headlinegreylight,textAlign: TextAlign.center,)),
              Container(width: double.infinity,child: Text(DefText.enterphonenumberas.tr,style: AppColor.headlinebluegray,textAlign: TextAlign.right,)),
              Row(
                children: [
                  Text('+993',style: AppColor.headlinebluegraybold,),
                  Expanded(
                      child:
                      CustomTextField(
                        controller: controller,
                        fomratter: [MaskedTextInputFormatter(
                            mask: 'xxxxxxxx', separator: ''),],
                        keybord: TextInputType.number,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(),),
            Expanded(
              child: ButtonCustom(
                text: DefText.send.tr,align: TextAlign.center, icon: FontAwesomeIcons.share,
                onTap: onTap,                ),
            ),
            Expanded(child: Container(),),
          ],
        ),
      ],
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

