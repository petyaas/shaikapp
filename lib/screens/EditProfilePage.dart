import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/services/snackBAr.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/ButtonCustom.dart';
import 'package:shaikapp/widgets/CustomTextField.dart';

class EDitProfilePage extends StatefulWidget {
  @override
  _EDitProfilePageState createState() => _EDitProfilePageState();
}

class _EDitProfilePageState extends State<EDitProfilePage> {
  final profileX = Get.put(ProfileX());

  final TextEditingController _namecontroller=new TextEditingController();

  final TextEditingController _phonecontroller=new TextEditingController();

   int gender=-1;
@override
  void initState() {
  _namecontroller.text=profileX.user.value.client_name;
  _phonecontroller.text=profileX.user.value.phone;
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DefText.profile.tr,style: AppColor.headlinebluegray,),
        centerTitle: true,
      ),
        body:
        Obx((){
          return
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: AppColor.backgroundcolorgrey,
                      child:
                      Obx((){
                        if(profileX.user.value.gender==0)
                        {
                          return
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: AssetImage('assets/icons/male.png'),
                            );
                        }
                        if(profileX.user.value.gender==1)
                        {
                          return
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: AssetImage('assets/icons/famale.png'),
                            );
                        }
                        if(profileX.user.value.gender==-1)
                        {
                          return
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              // backgroundImage: AssetImage('assets/icons/famale.png'),
                            );
                        }
                        return Text('some error..');
                      }),
                    ),
                  ],
                ),
                Divider(),
                CustomTextField(
                  controller: _namecontroller,
                  hint: profileX.user.value.client_name,
                  helperText: DefText.name.tr,
                  keybord: TextInputType.name,
                  // onchange: (text)
                  // {
                  //   print(_namecontroller.text);
                  //   // profileX.setClientName(text);
                  //   // profileX.user.value.client_name=text;
                  // },
                ),
                Divider(),
                CustomTextField(
                  enabled: false,
                  helperText: DefText.phone.tr,
                  controller: _phonecontroller,
                  // hint: profileX.user.value.phone,
                  keybord: TextInputType.number,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
//              width: 200,
                        child: RadioListTile<int>(
                          // selectedTileColor: AppColor.backgroundcolor,
                          activeColor: AppColor.backgroundcolor,
                          title:  Text('male'.tr,style: AppColor.headlinebluegray,),
                          value: 0,
                          groupValue:profileX.user.value.gender,
                          onChanged: (value) {
                            profileX.setgender(value!);
                            // profileX.user.value.gender=value!;
                            // gender=value!;

                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //            width: 100,
                        child: RadioListTile<int>(
                          activeColor: AppColor.backgroundcolor,
                          title:  Text('famale'.tr,style: AppColor.headlinebluegray,),
                          value: 1,
                          groupValue: profileX.user.value.gender,
                          onChanged: (value) {
                            profileX.setgender(value!);
                            // gender=value!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Container(),),
                    Expanded(
                      flex: 2,
                      child: ButtonCustom(
                        text: DefText.save.tr,align: TextAlign.center, icon: FontAwesomeIcons.save,
                        onTap: ()async{
                          profileX.user.value.client_name=_namecontroller.text;

                          // print(_namecontroller.text);
                          profileX.user.value.addres.add('Ahsha ajksd jasd');
                          profileX.user.value.addres.add('Ahsha ajksd jasd');
                          // print(profileX.user.value.client_name);
                          // print(profileX.user.value.addres);
                          // print(profileX.user.value.gender);
                          // print(profileX.user.value.phone);
                          // print(profileX.user.value.id);
                          if(await GetData().editProfile(profileX.user.value)==true)
                            {
                              // profileX.user.value.client_name=_namecontroller.text;
                              profileX.editProfile(profileX.user.value);
                              Get.back();
                              ShowSnackBar('SHAIK',DefText.editprofiletrue.tr);
                            }
                          else
                            {
                              Get.back();
                              ShowSnackBar('SHAIK',DefText.editprofilefalse.tr);
                            }
                        },                ),
                    ),
                    Expanded(child: Container(),),
                  ],
                ),

              ],
            );
        }),
    );
  }
}
