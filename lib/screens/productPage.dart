import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/LangSelector.dart';
import 'package:shaikapp/services/snackBAr.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/BagButton.dart';
import 'package:shaikapp/widgets/ImageLoader.dart';
import 'package:shaikapp/widgets/ProductStatus.dart';
import 'package:shaikapp/widgets/productLike.dart';
class ProductPage extends StatelessWidget {
   Products product;
   bool isliked;

   ProductPage({required this.product,required this.isliked});
   final productX = Get.put(ProductX());
   final profileX = Get.put(ProfileX());

  @override
  Widget build(BuildContext context) {
    final langSelectorX = Get.put(LangSelector());
    String analog;
    String img;
    List<dynamic> about;
    if(langSelectorX.istklang.value==false)
      {
        analog=product.analog_tk;
        img=product.img_tk.middle;
        about=product.about_tk;
      }
    else{
      analog=product.analog_ru;
      img=product.img_ru.middle;
      about=product.about_ru;
    }

    return Scaffold(
      appBar: AppBar(
        title:  Text(product.code+' (${analog})',style: AppColor.headlinebluegray,),
      ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
          Container(
            height:  MediaQuery.of(context).size.height*0.5,
            color: Colors.white,
            child: Stack(
              children: [
                Center(child: ImageLaoder(url: img,)),
                if(product.status!='OLD')
                  ProductStatus(status: product.status.tr,),
                Obx((){
                  return
                    ProductLike(isLiked: productX.chekLikeById(product.id),
                      onTap: (){
                      if(profileX.user.value.id!=''){productX.setLike(profileX.user.value.id, product.id);}
                      else{ShowSnackBar(DefText.alert.tr,DefText.signinpls.tr);}
                      },);
                }),
              ],
            ),
          ),
            Divider(height: 2,),

            Container(
              color: Colors.white,
              height: 20,
              child: Row(
                children: [
                  productStates(icon: FontAwesomeIcons.truck, count: product.buying,),
                  productStates(icon: FontAwesomeIcons.eye, count: product.visited,),
                  productStates(icon: FontAwesomeIcons.heart, count: product.like_count,),
                  productStates(icon: FontAwesomeIcons.database, count: product.volume,comment: 'ml',),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(product.code+' (${analog})',style: AppColor.headlinebluegraybold,)
            ),
            Divider(height: 2,),

            Container(
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Expanded(flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    width: 2,
                    color: AppColor.backgroundLightcolor,
                  ),
                  Expanded(flex: 1,child: BagButton(product: product, mycontext: context,)),
                ],
              ),
            ),
            Divider(height: 2,),
            Divider(height: 2,),
            for(int i=0;i<=about.length-1;i++)
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                  child: Text(about[i],style: AppColor.headlinebluegray,)
              ),
          ],
        )
    );
  }
}

class productStates extends StatelessWidget {

  final IconData icon;
  final int count;
  final String? comment;
  VoidCallback? onTap;
  productStates({required this.icon,this.onTap,required this.count,this.comment=''});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:
        InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FaIcon(
                    icon,
                    size: 15,
                    color: AppColor.backgroundcolorgrey,
                  ),
                ),
              Text(count.toString()+' '+comment!,style: AppColor.headlinebluegraymini,)
            ],
          ),
        )
    );
  }
}
