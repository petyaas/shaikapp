
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/consts.dart';
class Categories extends StatelessWidget {
  final int index;
  Categories({required this.index});
  final categoryX = Get.put(CategoryGetX());

  @override
  Widget build(BuildContext context) {
    return
      Obx((){
            if(categoryX.status.value==xStatus.empty){
      return Text('Empty...');
            }
            if(categoryX.status.value==xStatus.loading){
      return Center(child: CircularProgressIndicator(),);
            }
            if(categoryX.status.value==xStatus.loaded)
      {
        return
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.height-60)*0.25,
                width:  MediaQuery.of(context).size.width*0.4,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: apiConsts.host
                      +categoryX.listOfCategory!.value[index].img_tk,
                ),
              ),
              Text(categoryX.listOfCategory!.value[index].name_tk),
            ],
          );

      }
            return Center(child: Text('Error..'),);

        });
  }
}
