import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/models/clientProfile.dart';
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

  final TextEditingController _namecontroller = new TextEditingController();
  final TextEditingController _addresscontroller = new TextEditingController();

  final TextEditingController _phonecontroller = new TextEditingController();
  FocusNode focusNode = new FocusNode();
  int gender = -1;
  @override
  void initState() {
    _namecontroller.text = profileX.user.value.client_name;
    _phonecontroller.text = profileX.user.value.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ClientProfile user=profileX.user.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DefText.profile.tr,
          style: AppColor.headlinebluegray,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                profileX.user.value.client_name = _namecontroller.text;
                if (await GetData().editProfile(profileX.user.value) == true) {
                  // profileX.user.value.client_name=_namecontroller.text;
                  profileX.editProfile(profileX.user.value);
                  Get.back();
                  ShowSnackBar('SHAIK', DefText.editprofiletrue.tr);
                } else {
                  Get.back();
                  ShowSnackBar('SHAIK', DefText.editprofilefalse.tr);
                }
              },
              icon: Icon(FontAwesomeIcons.save)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Obx(() {
          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColor.backgroundcolorgrey,
                    child: Obx(() {
                      if (profileX.user.value.gender == 0) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: AssetImage('assets/icons/male.png'),
                        );
                      }
                      if (profileX.user.value.gender == 1) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: AssetImage('assets/icons/famale.png'),
                        );
                      }
                      if (profileX.user.value.gender == -1) {
                        return CircleAvatar(
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
              Divider(color: AppColor.backgroundcolorgrey,),
              CustomTextField(
                controller: _namecontroller,
                hint: profileX.user.value.client_name,
                helperText: DefText.name.tr,
                keybord: TextInputType.name,
              ),
              Divider(),
              CustomTextField(
                enabled: false,
                helperText: DefText.phone.tr,
                controller: _phonecontroller,
                // hint: profileX.user.value.phone,
                keybord: TextInputType.number,
              ),
              Divider(color: AppColor.backgroundcolorgrey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Gender
                  Expanded(
                    child: Container(
//              width: 200,
                      child: RadioListTile<int>(
                        activeColor: AppColor.backgroundcolor,
                        title: Text(
                          DefText.male.tr,
                          style: AppColor.headlinebluegray,
                        ),
                        value: 0,
                        groupValue: profileX.user.value.gender,
                        onChanged: (value) {
                          profileX.setgender(value!);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //            width: 100,
                      child: RadioListTile<int>(
                        activeColor: AppColor.backgroundcolor,
                        title: Text(
                          DefText.famele.tr,
                          style: AppColor.headlinebluegray,
                        ),
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
              Divider(color: AppColor.backgroundcolorgrey,),
              AutoSizeText(DefText.adresses.tr),
              SizedBox(height: 5,),
              CustomTextField(
                controller: _addresscontroller,
                // hint: profileX.user.value.client_name,
                keybord: TextInputType.text,
                focus: focusNode,
                actionWidget:
                IconButton(
                  onPressed: (){
                    if(profileX.user.value.address.contains(_addresscontroller.text)==false)
                      {
                        profileX.user.value.address.add(_addresscontroller.text);
                        profileX.user.refresh();
                      }
                    _addresscontroller.text='';
                    focusNode.unfocus();
                  },
                  icon: Icon(FontAwesomeIcons.plusCircle,color: AppColor.backgroundcolorgrey,),),
              ),
              Divider(color: AppColor.backgroundcolorgrey,),
              for(int i=0;i<=profileX.user.value.address.length-1;i++)
                Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(profileX.user.value.address[i].toString(),maxLines: 2,minFontSize: 12,style: AppColor.headlinebluegray,),
                          IconButton(onPressed: (){
                            profileX.user.value.address.removeAt(i);
                            profileX.user.refresh();
                          }, icon: Icon(FontAwesomeIcons.trashAlt))
                        ],
                      ),
                    ),
                    Divider(color: AppColor.backgroundcolorgrey,),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
