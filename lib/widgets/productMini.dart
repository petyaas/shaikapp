import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/screens/productPage.dart';
import 'package:shaikapp/services/LangSelector.dart';
import 'package:shaikapp/services/snackBAr.dart';
import 'package:shaikapp/widgets/ImageLoader.dart';
import 'package:shaikapp/widgets/productLike.dart';

import '../style.dart';
import 'BagButton.dart';
import 'ProductStatus.dart';
class ProductMini extends StatelessWidget {
  Products product;
  bool isliked;
  BuildContext mycontext;
  // VoidCallback onTap;
  ProductMini(
      {
        required this.product,
        required this.isliked,
        required this.mycontext
    // required this.onTap
      });
  @override
  Widget build(BuildContext context) {

    final langSelectorX = Get.put(LangSelector());
    final productX = Get.put(ProductX());
    final profileX = Get.put(ProfileX());

    return Container(
      // padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 250,width:  (MediaQuery.of(context).size.width*0.45),
      child:
      Stack(
        children: [
          InkWell(
            onTap: (){
              Get.to(()=>ProductPage(product: product, isliked:isliked,));
              },
            child: Column(
              children: [
                if(langSelectorX.istklang.value==false)Expanded(
                  flex: 5,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ImageLaoder(url: product.img_tk.little,),
                  ),
                ),
                if(langSelectorX.istklang.value==true)Expanded(
                  flex: 5,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ImageLaoder(url: product.img_ru.little,),
                  ),
                ),
                if(langSelectorX.istklang.value==false)Expanded(
                    child:
                    AutoSizeText(
                      product.code+' (${product.analog_tk})',
                      style: AppColor.headlinebluegray,
                      textAlign: TextAlign.center,
                      minFontSize: 8,
                      maxLines: 2,
                    )
                ),
                if(langSelectorX.istklang.value==true)Expanded(
                    child:
                    AutoSizeText(
                      product.code+' (${product.analog_ru})',
                      style: AppColor.headlinebluegray,
                      textAlign: TextAlign.center,
                      minFontSize: 8,
                      maxLines: 2,
                    )
                ),
                Expanded(
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          product.new_price.toString()+' TMT',
                          style: AppColor.productpricetext,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                          maxLines: 1,
                        ),
                        if(product.old_price!=0)
                          AutoSizeText(
                            product.old_price.toString()+' TMT',
                            style: AppColor.productOldPriceText,
                            textAlign: TextAlign.center,
                            minFontSize: 8,
                            maxLines: 1,
                          ),
                      ],
                    )
                ),
                BagButton(product: product, mycontext: mycontext,),
              ],
            ),
          ),
          // if(product.status!='OLD')
          ProductStatus(status: product.status.tr,),
                 ProductLike(isLiked: isliked,
                 onTap: (){
                   if(profileX.user.value.id!='')
                   { productX.setLike(profileX.user.value.id, product.id);}
                   else{ShowSnackBar(DefText.alert.tr,DefText.signinpls.tr);}

                   },),

        ],
      ),
    );
  }
}
