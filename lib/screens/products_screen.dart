import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shaikapp/widgets/productMini.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    final productX = Get.put(ProductX());
    final screenControlX = Get.put(ScreenControllerX());

    return WillPopScope(
      onWillPop: () async{
        screenControlX.setIndex(1);
        return false;
      },
      child: FadeInRight(
        duration: Duration(milliseconds: 100),
        child: Obx(() {
          if (productX.productStatus == xStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (productX.productStatus == xStatus.empty) {
            return Center(
              child: Text('empty!!!'),
            );
          }

          if (productX.productStatus == xStatus.loaded) {
            print((productX.listOfProducts!.length/2).ceil().toString());
            int count=0;
            return
                  ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemCount: (productX.listOfProducts!.length/2).ceil(),
                      itemBuilder: (BuildContext context, int index) {
                        print(index.toString());
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx((){
                              return
                                ProductMini(product: productX.listOfProducts![index*2], isliked: productX.likeProduct!.value[index*2], mycontext: context,);
                            }),
                            if((index*2)+1<=productX.listOfProducts!.length-1)
                              Obx((){
                                return
                                  ProductMini(product: productX.listOfProducts![(index*2)+1], isliked: productX.likeProduct!.value[(index*2)+1], mycontext: context,);
                              }),
                            if((index*2)+1>productX.listOfProducts!.length-1)
                        Container(color: Colors.transparent,height: 250,width:  (MediaQuery.of(context).size.width*0.45),),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
              //ProductMini(product: productX.listOfProducts![0],);
          }

          return Center(
            child: Text('error'),
          );
        }),
      ),
    );
    Container();
  }
}
