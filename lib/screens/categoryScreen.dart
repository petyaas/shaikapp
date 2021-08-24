import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/widgets/categors.dart';
class CategoryScreen extends StatelessWidget {
 const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final categoryX = Get.put(CategoryGetX());

    return  FadeInRight(
      duration: Duration(milliseconds: 100),
      child:
          Obx((){
                return
                  Stack(
                    children: [
                      if(categoryX.listOfCategory!.length!=0)ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: categoryX.listOfCategory!.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Categories(
                            category: categoryX.listOfCategory!.value[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                      ),
                      if(categoryX.listOfCategory!.length==0)
                        Center(child: CircularProgressIndicator()),

                    ],
                  );
          }),

    );
  }
}
