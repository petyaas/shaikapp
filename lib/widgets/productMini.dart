import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/screens/productPage.dart';
import 'package:shaikapp/widgets/ImageLoader.dart';

import '../style.dart';
import 'BagButton.dart';
import 'ProductStatus.dart';
class ProductMini extends StatelessWidget {
  Products product;
  // VoidCallback onTap;
  ProductMini(
      {
        required this.product,
    // required this.onTap
      });
  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColor.productshadow.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: 300,width:  (MediaQuery.of(context).size.width*0.45),
      child:
      Stack(
        children: [
          InkWell(
            onTap: (){Get.to(ProductPage(product: product,));},
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ImageLaoder(url: product.img_tk.little,),
                  ),
                ),
                Expanded(
                    child:
                    AutoSizeText(
                      product.code+' (${product.analog_tk})',
                      style: AppColor.headlinebluegray,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
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
                          minFontSize: 10,
                          maxLines: 1,
                        ),
                        if(product.old_price!=0)
                          AutoSizeText(
                            product.old_price.toString()+' TMT',
                            style: AppColor.productOldPriceText,
                            textAlign: TextAlign.center,
                            minFontSize: 10,
                            maxLines: 1,
                          ),
                      ],
                    )
                ),
                BagButton(product: product,),
              ],
            ),
          ),
          if(product.status!='OLD')
            ProductStatus(status: product.status,),
        ],
      ),
    );
  }
}
