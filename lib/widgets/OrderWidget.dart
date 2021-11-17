import 'package:auto_size_text/auto_size_text.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/tiOrder.dart';
import 'package:shaikapp/services/snackBAr.dart';

import '../consts.dart';
import '../style.dart';
import 'CustomTextField.dart';
import 'categors.dart';
class OrderWidget extends StatelessWidget {

  // final productX = Get.put(ProductX());
  // final profileX = Get.put(ProfileX());
  TextEditingController _nameController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _addressController=new TextEditingController();
  TextEditingController _hourController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text=Get.find<ProfileX>().user.value.client_name;
    _phoneController.text=Get.find<ProfileX>().user.value.phone;
    if(Get.find<ProfileX>().user.value.address.length!=0)
      {_addressController.text=Get.find<ProfileX>().user.value.address.last;}
    else{_addressController.text='';}


    ToOrder _order=ToOrder(
        client_id: Get.find<ProfileX>().user.value.id,
        address: _addressController.text,
        phone: _phoneController.text,
        order_name: _nameController.text,
        delivery_date: '');
    bool today=true;
    bool yesterday=true;

    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
        // trailing:Icon(FontAwesomeIcons.truck,color: AppColor.backgroundcolorgrey,),
      title:
      Obx((){
        if(Get.find<ProductX>().orderInfo.value.delivery==true)
          {
            return
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            AutoSizeText(
                              DefText.totalPriceBag.tr+'-'+Get.find<ProductX>().totalPrice.value.toString()+' TMT',style: AppColor.headlinebluegray,
                              minFontSize: 7,
                              maxLines: 1,
                              maxFontSize: 16,
                            ),

                          ],
                        ),
                        if(Get.find<ProductX>().totalPrice.value<Get.find<ProductX>().orderInfo.value.delivery_price)
                          AutoSizeText(DefText.priceIsSmall.tr,style: TextStyle(color: AppColor.red),maxLines: 1,maxFontSize: 14,),
                        if(Get.find<ProductX>().totalPrice.value>=Get.find<ProductX>().orderInfo.value.delivery_price)
                          AutoSizeText(DefText.priceIsGood.tr,style: AppColor.headlinegreenbold1,maxLines: 1,maxFontSize: 14,),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.find<ProfileX>().toOrder(_addressController.text, _phoneController.text, _nameController.text,Get.find<ProductX>().orderInfo.value.deliverDate);
                    },
                    child: Container(
                      height: 30,
                      // width: 100,
                      decoration: BoxDecoration(
                          color: AppColor.backgroundcolorgrey,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Center(child: AutoSizeText(DefText.toOrder.tr,style: AppColor.headlinewhite,maxLines: 1,maxFontSize: 14,minFontSize: 8,textAlign: TextAlign.center,)),
                      ),
                    ),
                  ),
                ],
              );
          }
        else{
          return
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            DefText.totalPriceBag.tr+'-'+Get.find<ProductX>().totalPrice.value.toString()+' TMT',style: AppColor.headlinebluegray,
                            minFontSize: 7,
                            maxLines: 1,
                            maxFontSize: 16,
                          ),

                        ],
                      ),
                      AutoSizeText(DefText.deliveryNotSup.tr,style: TextStyle(color: AppColor.red),maxLines: 3,maxFontSize: 14,),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    // Get.find<ProfileX>().toOrder(_addressController.text, _phoneController.text, _nameController.text);
                    if(Get.find<ProductX>().orderInfo.value.delivery==true)
                      {
                        Get.find<ProfileX>().toOrder(_addressController.text, _phoneController.text, _nameController.text,Get.find<ProductX>().orderInfo.value.deliverDate);
                      }
                    else
                      {
                        ShowSnackBar('SHAIK', DefText.deliveryNotSup.tr);
                      }
                  },
                  child: Container(
                    height: 30,
                    // width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.backgroundcolorgrey,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: Center(child: AutoSizeText(DefText.toOrder.tr,style: AppColor.headlinewhite,maxLines: 1,maxFontSize: 14,minFontSize: 8,textAlign: TextAlign.center,)),
                    ),
                  ),
                ),
              ],
            );

        }
    }),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.truck,color: AppColor.backgroundcolorgrey,),
        ],
      ),
      textColor: AppColor.grey,
      collapsedTextColor: AppColor.red,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            contentPadding:const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            controller: _nameController,
            hint: DefText.name.tr,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            contentPadding:const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            controller: _phoneController,
            keybord: TextInputType.phone,
            hint: DefText.phone.tr,
          ),
        ),
        AutoSizeText(DefText.delivertime.tr,style: AppColor.headlinebluegray2,textAlign: TextAlign.start,),
        Divider(color: AppColor.backgroundcolorgrey,),
        Obx(()
        {
          return
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width:150,
                  child: Column(
                    children: [
                      Container(
                   height: 40,
                        child: RadioListTile<int>(
                          activeColor: AppColor.backgroundcolor,
                          title: AutoSizeText(
                            DefText.toDay.tr,
                            style: AppColor.headlinebluegray,
                            maxLines: 1,
                          ),
                          value: 0,
                          groupValue: Get.find<ProductX>().orderInfo.value.toDay,
                          onChanged: (value) {
                            Get.find<ProductX>().setOrderDay(0);
                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: RadioListTile<int>(
                          activeColor: AppColor.backgroundcolor,
                          title: AutoSizeText(
                            DefText.yesterday.tr,
                            style: AppColor.headlinebluegray,
                            maxLines: 1,
                          ),
                          value: 1,
                          groupValue:Get.find<ProductX>().orderInfo.value.toDay,
                          onChanged: (value) {
                            Get.find<ProductX>().setOrderDay(1);

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child:
                  Column(
                    children: [
                      // if(Get.find<ProductX>().orderInfo.value.toDay==0)
                      //   AutoSizeText(DefText.toDay.tr,style: AppColor.headlinegreen,),
                      // if(Get.find<ProductX>().orderInfo.value.toDay==1)
                        AutoSizeText(DefText.oClock.tr,style: AppColor.headlinegreen.merge(TextStyle(fontSize: 12)),),
                      //
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: (){


                          Navigator.of(context).push(
                            showPicker(
                              is24HrFormat:true,
                              context: context,
                              minHour: Get.find<ProductX>().orderInfo.value.dminMinute,
                              maxHour: Get.find<ProductX>().orderInfo.value.dmaxMinute,
                              value: TimeOfDay.fromDateTime(DateFormat("HH:ss").parse(Get.find<ProductX>().orderInfo.value.deliveryHour)),
                              onChange: (TimeOfDay newTime){
                                Get.find<ProductX>().setDeliveryTime(newTime.hour.toString()+':'+newTime.minute.toString());
                              },
                            ),
                          );

                        },
                        child: Container(
                          width: 100,
                            decoration: BoxDecoration(
                              color:AppColor.white,
                                border: Border.all(
                                  color: AppColor.gold,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
        padding:EdgeInsets.all(5),
                            child: AutoSizeText(Get.find<ProductX>().orderInfo.value.deliveryHour,style: AppColor.productpricetext,textAlign: TextAlign.center,)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        }),
        AutoSizeText(DefText.adress.tr,style: AppColor.headlinebluegray2,textAlign: TextAlign.start,),
        Divider(color: AppColor.backgroundcolorgrey,),
    ExpansionTile(
    expandedAlignment: Alignment.topLeft,
      title: CustomTextField(
        contentPadding:const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
        controller: _addressController,
        keybord: TextInputType.text,
      ),
      children: [
        Container(
          height: 180,
          child:

          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: Get.find<ProfileX>().user.value.address.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  _addressController.text=Get.find<ProfileX>().user.value.address[index].toString();
                },
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(Get.find<ProfileX>().user.value.address[index].toString(),maxLines: 2,minFontSize: 12,style: AppColor.headlinebluegray,),
                      Icon(FontAwesomeIcons.checkCircle),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(color: AppColor.backgroundcolorgrey,),
          ),
        )
      ],
    ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: InkWell(
        //     child:
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         AutoSizeText(DefText.adress.tr,style: AppColor.headlinebluegray2,textAlign: TextAlign.start,),
        //         Divider(color: AppColor.backgroundcolorgrey,),
        //         Container(
        //           height: 40,
        //           width: double.infinity,
        //           child:
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Icon(FontAwesomeIcons.mapMarkedAlt,color: AppColor.backgroundcolorgrey,),
        //               ),
        //               Expanded(child: AutoSizeText(Get.find<ProfileX>().user.value.address.last,style: AppColor.headlinebluegray,textAlign:TextAlign.start,maxLines: 2,)),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Icon(FontAwesomeIcons.listOl,color: AppColor.backgroundcolorgrey,),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Divider(color: AppColor.backgroundcolorgrey,),
        //       ],
        //     ),
        //   ),
        // ),
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


