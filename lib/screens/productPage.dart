import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/BagButton.dart';
import 'package:shaikapp/widgets/ImageLoader.dart';
import 'package:shaikapp/widgets/ProductStatus.dart';
class ProductPage extends StatelessWidget {
   Products product;
   ProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(product.code+' (${product.analog_tk})',style: AppColor.headlinebluegray,),
      ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
          Container(
            height:  MediaQuery.of(context).size.height*0.5,
            color: Colors.white,
            child: Stack(
              children: [
                ImageLaoder(url: product.img_tk.middle,),
                if(product.status!='OLD')
                  ProductStatus(status: product.status,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(FontAwesomeIcons.heart),color: AppColor.backgroundcolorgrey,),
                  ],
                ),
              ],
            ),
          ),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('SHAIK № '+product.code+' (${product.analog_tk})',style: AppColor.headlinebluegraybold,)
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
                    color: AppColor.backgroundcolorgrey,
                  ),
                  Expanded(flex: 1,child: BagButton(product: product,)),
                ],
              ),
            ),
            Divider(height: 2,),
            Container(
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  productStates(icon: FontAwesomeIcons.truck, count: product.buying,),
                  Container(
                    width: 2,
                    color: AppColor.backgroundcolorgrey,
                  ),
                  productStates(icon: FontAwesomeIcons.eye, count: product.visited,),
                  Container(
                    width: 2,
                    color: AppColor.backgroundcolorgrey,
                  ),
                  productStates(icon: FontAwesomeIcons.database, count: product.volume,),
                ],
              ),
            ),
            Divider(height: 2,),
            for(int i=0;i<=product.about_tk.length-1;i++)
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                  child: Text(product.about_tk[i],style: AppColor.headlinebluegray,)
              ),
          ],
        )
    );
  }
}

class productStates extends StatelessWidget {

  final IconData icon;
  final int count;
  productStates({required this.icon,required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              FaIcon(
                icon,
                size: 20,
                color: AppColor.backgroundcolorgrey,
              ),
            Text(count.toString())
          ],
        )
    );
  }
}
