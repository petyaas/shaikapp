import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/snackBAr.dart';

import '../consts.dart';
import '../style.dart';
class BagButton extends StatelessWidget {
  Products product;
  BuildContext mycontext;
  BagButton({required this.product,required this.mycontext});
  final productX = Get.put(ProductX());
  final profileX = Get.put(ProfileX());

  @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      for (int i = 0; i <= productX.bagList.value.length - 1; i++) {
        if(productX.bagList.value[i].product_id==product.id)
          {
            return onBagList(productX: productX, i: i, profileX: profileX, product: product, mycontext: mycontext,);
          }
      }
        return addToBag(profileX: profileX, productX: productX, product: product);

    });

  }
}

class addToBag extends StatelessWidget {
  const addToBag({
    Key? key,
    required this.profileX,
    required this.productX,
    required this.product,
  }) : super(key: key);

  final ProfileX profileX;
  final ProductX productX;
  final Products product;

  @override
  Widget build(BuildContext context) {
    Color _btncolor=AppColor.productprice;
    String _btntext='';
    if(product.count>0)
      {
         _btncolor=AppColor.productprice;
         _btntext=DefText.addToBag.tr;
      }
    else{
       _btncolor=AppColor.laghtBlueGray;
       _btntext=DefText.nullproduct.tr;
    }

    return InkWell(
      onTap:() {
        if(profileX.user.value.id!=''){
          if(product.count>0)
            {productX.addBag(profileX.user.value.id, product.id, 1,product.new_price);}
        }else{ShowSnackBar(DefText.alert.tr,DefText.signinpls.tr);}
      },
      child:
      Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _btncolor,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 40,
        child: Center(
          child: AutoSizeText(
            _btntext,
            maxLines: 1,
            style: AppColor.headlinewhitebol2,

          ),
        ),
      ),
    );
  }
}

class onBagList extends StatelessWidget {

  const onBagList({
    Key? key,
    required this.productX,
    required this.i,
    required this.profileX,
    required this.product,
    required this.mycontext,
  }) : super(key: key);

  final ProductX productX;
  final int i;
  final ProfileX profileX;
  final Products product;
  final BuildContext mycontext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: (){
              if(productX.bagList.value[i].amount>1)
                {
                  productX.addBag(profileX.user.value.id, product.id, productX.bagList.value[i].amount-1,product.new_price);
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
                      productX.bagList.refresh();
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
                child: AutoSizeText(productX.bagList.value[i].amount.toString(),minFontSize: 8,maxLines: 1,style: AppColor.headlinebluegraybold,))),

        if(productX.bagList.value[i].amount<product.count)
        Expanded(
          flex: 2,
          child:
          InkWell(
            onTap:
                (){
              if(productX.bagList.value[i].amount<product.count)
                {productX.addBag(profileX.user.value.id, product.id, productX.bagList.value[i].amount+1,product.new_price);}
              else{
                // ShowSnackBar(DefText.alert.tr,DefText.nomuchproduct.tr);
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
                child: Icon(FontAwesomeIcons.plus,color: Colors.white,size: 18,),
              ),
            ),
          ),
        ),
        if(productX.bagList.value[i].amount>=product.count)
          Expanded(
            flex: 2,
            child:
            InkWell(
              onTap:
                  (){
                if(productX.bagList.value[i].amount<product.count)
                {productX.addBag(profileX.user.value.id, product.id, productX.bagList.value[i].amount+1,product.new_price);}
                else{
                  // _pluscolor=Colors.black;

                  ShowSnackBar(DefText.alert.tr,DefText.nomuchproduct.tr);
                }
              },
              child:
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.laghtBlueGray,
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

          Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText((productX.bagList.value[i].amount*product.new_price).toString(),
                maxLines: 1,minFontSize: 5,maxFontSize: 14,style: AppColor.headlinegreen,),
              AutoSizeText('TMT',maxLines: 1,minFontSize: 5,maxFontSize: 8,),

            ],
          ),
        ),
      ],
    );
  }
}
