import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/widgets/productMini.dart';

import '../consts.dart';
import '../style.dart';

class TopListWidget extends StatelessWidget {
  String titleText;
  List<Products> list;
  TopListWidget({Key? key,required this.list,required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: AppColor.white,
          height: 300,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Get.find<ProductX>().getTopSalesList('');
                },
                child:
                Container(
                  height: 30,
                  child:
                  Row(
                    children: [
                      Expanded(child: AutoSizeText(titleText,maxLines: 1,maxFontSize: 30,style: AppColor.headlinebluegray,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next))
                    ],
                  ),
                ),
              ),
              Divider(color: AppColor.laghtBlueGray,),
              Obx((){
                if(Get.find<ProductX>().topSalesList.value==xStatus.loaded)
                {
                  return
                    Expanded(
                      child: ListView.builder(
                          scrollDirection:Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // width: 100,height: 100,
                              child:
                              Obx((){
                                return
                                  ProductMini(
                                    product: list[index],
                                    isliked: Get.find<ProductX>().chekLikeById(list[index].id),
                                    mycontext: context,);

                              }),
                            );
                          }
                      ),
                    );
                }
                else{
                  if(Get.find<ProductX>().topSalesList.value==xStatus.loading)
                  {
                    return
                      Center(child: CircularProgressIndicator(),);

                  }
                  if(Get.find<ProductX>().topSalesList.value==xStatus.error)
                  {
                    return
                      Center(child: Text('error'),);
                  }
                  return Text('nene');
                }
              }),
              Divider(),
            ],
          ),
        ),
      );
  }
}
