import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/widgets/productMini.dart';
class LikedScreen extends StatelessWidget {
  final productX = Get.put(ProductX());

  @override
  Widget build(BuildContext context) {
    productX.getByListId(productX.likeList.value);
    return FadeInDownBig(
        duration: Duration(milliseconds: 100),
        child: Obx((){
          if(productX.byListIdStatus.value==xStatus.empty){
            return Text('Some Error...');
          }
          if(productX.byListIdStatus.value==xStatus.loading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(productX.byListIdStatus.value==xStatus.loaded){
            print(productX.listOfProducts!.value.length.toString());
            int count=0;
            return
              ListView.separated(
                padding: EdgeInsets.all(10),
                // itemCount: productX.listOfProducts!.value.length,
                itemCount: (productX.listOfProducts!.length/2).ceil(),
                itemBuilder: (BuildContext context, int index) {
                  print(index.toString());
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                  // ProductMini(product: productX.listOfProducts!.value[index], isliked: productX.likeProduct!.value[index],),

                  Obx((){
                        return
                          ProductMini(product: productX.listOfProducts![index*2], isliked: productX.likeProduct!.value[index*2],);
                      }),
                      if((index*2)+1<=productX.listOfProducts!.length-1)
                        Obx((){
                          return
                            ProductMini(product: productX.listOfProducts![(index*2)+1], isliked: productX.likeProduct!.value[(index*2)+1],);
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
          return Text('Some Error...');
        }),
    );
  }
}
