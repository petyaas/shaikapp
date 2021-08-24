import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          if (productX.status == xStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (productX.status == xStatus.empty) {
            return Center(
              child: Text('empty!!!'),
            );
          }

          if (productX.status == xStatus.loaded) {
            print((productX.listOfProducts!.length/2).ceil().toString());
            int count=0;
            return
              ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: (productX.listOfProducts!.length/2).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    print(index.toString());
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        ProductMini(product: productX.listOfProducts![index*2],),
                        if((index*2)+1<=productX.listOfProducts!.length-1)
                          ProductMini(product: productX.listOfProducts![(index*2)+1],),
                        if((index*2)+1>productX.listOfProducts!.length-1)
                    Container(color: Colors.transparent,height: 300,width:  (MediaQuery.of(context).size.width*0.45),),
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
