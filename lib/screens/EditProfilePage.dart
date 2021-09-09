import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
        title: Text('profile',style: AppColor.headlinebluegray,),
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
                    Container(
                      height: 100, width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 3,
                            color: AppColor.backgroundcolorgrey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Icon(FontAwesomeIcons.user,size: 50,color: AppColor.backgroundcolorgrey,),
                    ),
                  ],
                ),
                Divider(),
                CustomTextField(
                  controller: _namecontroller,
                  hint: profileX.user.value.client_name,
                  helperText: 'name',
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
                  helperText: 'phone',
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
                      child: ButtonCustom(
                        text: 'save',align: TextAlign.center, icon: FontAwesomeIcons.save,
                        onTap: ()async{
                          profileX.user.value.client_name=_namecontroller.text;

                          print(_namecontroller.text);
                          profileX.user.value.addres.add('Ahsha ajksd jasd');
                          profileX.user.value.addres.add('Ahsha ajksd jasd');
                          print(profileX.user.value.client_name);
                          print(profileX.user.value.addres);
                          print(profileX.user.value.gender);
                          print(profileX.user.value.phone);
                          print(profileX.user.value.id);
                          if(await GetData().editProfile(profileX.user.value)==true)
                            {
                              // profileX.user.value.client_name=_namecontroller.text;
                              profileX.editProfile(profileX.user.value);
                              Get.back();
                              ShowSnackBar('SHAIK','editprofiletrue');
                            }
                          else
                            {
                              Get.back();
                              ShowSnackBar('SHAIK','editprofilefalse');
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
