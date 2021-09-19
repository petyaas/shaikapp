import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';

import '../consts.dart';
import '../style.dart';
class BagButton extends StatelessWidget {
  Products product;
  BagButton({required this.product});
  final productX = Get.put(ProductX());
  final profileX = Get.put(ProfileX());

  @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      // bool _isFind=false;
      for (int i = 0; i <= productX.bagList.value.length - 1; i++) {
        if(productX.bagList.value[i].product_id==product.id)
          {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.productprice
                    // color: Colors.red[500],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        if(productX.bagList.value[i].count>1)
                          {
                            productX.addBag(profileX.user.value.id, product.id, productX.bagList.value[i].count-1);
                          }
                        else{
                          Get.defaultDialog(
                              textConfirm: DefText.yes.tr,
                              textCancel: DefText.cancel.tr,
                              confirmTextColor: AppColor.backgroundcolorgrey,
                              cancelTextColor: AppColor.backgroundcolorgrey,
                              buttonColor: Colors.white,
                              backgroundColor: Color(0xFFF2F2F2),
                              onConfirm: () {
                                productX.deleteFromBAg(profileX.user.value.id, product.id);
                                productX.bagList.value.removeAt(i);
                                Get.back();
                              },
                              title: DefText.alert.tr,
                              titleStyle: AppColor.headlinebluegray,
                              content:
                              Text(DefText.alertdeleteBag.tr,style: AppColor.headlinebluegray,)
                          );

                        }

                      },
                      child:
                      Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.productprice,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 40,
                        child: Center(
                          child: Icon(FontAwesomeIcons.minus,color: Colors.white,size: 18,),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 2,
                      child: Center(
                          child: AutoSizeText(productX.bagList.value[i].count.toString(),minFontSize: 8,maxLines: 1,style: AppColor.headlinebluegraybold,))),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        productX.addBag(profileX.user.value.id, product.id, productX.bagList.value[i].count+1);
                      },
                      child:
                      Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.productprice,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 40,
                        child: Center(
                          child: Icon(FontAwesomeIcons.plus,color: Colors.white,size: 18,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      }
        return InkWell(
          onTap: (){
            productX.addBag(profileX.user.value.id, product.id, 1);
          },
          child:
          Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.productprice,
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 40,
            child: Center(
              child: Text(
                DefText.addToBag.tr,
                style: AppColor.headlinewhitebol2,

              ),
            ),
          ),
        );

    });

  }
}
