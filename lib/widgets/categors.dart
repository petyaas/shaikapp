import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shaikapp/getX/categoryX.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/getX/screenControllerX.dart';
import 'package:shaikapp/models/category_list.dart';
import 'package:shaikapp/services/LangSelector.dart';

import '../style.dart';
import 'CustomExpansionTile.dart';
import 'package:get/get.dart';
final productX = Get.put(ProductX());

class Categories extends StatelessWidget {

  final CategoryList category;
  final bool isExpland;
  Categories({required this.category,required this.isExpland});
  @override
  Widget build(BuildContext context) {
    final langSelectorX = Get.put(LangSelector());
    final categoryX = Get.put(CategoryGetX());

    return
      CustomExpansionTile(
        onExpansionChanged: (bool){
          for(int i=0;i<=categoryX.listOfCategory!.value.length-1;i++)
            {
              if(categoryX.listOfCategory!.value[i].name_tk==category.name_tk)
                {
                 categoryX.CategoryExpland!.value[i]=bool;
                }
            }
        },
        initiallyExpanded: isExpland,
       title: Row(
         children: [
           if(langSelectorX.istklang.value==false)
           Text(
             category.name_tk,
             style: AppColor.headlinebluegray,
           ),
           if(langSelectorX.istklang.value==true)
             Text(
               category.name_ru,
               style: AppColor.headlinebluegray,
             ),

         ],
       ),
       children: <Widget>[
         Divider(
           color: AppColor.greyblue,
         ),
         subcategory(category: category,)

       ],
        );
  }
}

class subcategory extends StatelessWidget {
  const subcategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryList category;

  @override
  Widget build(BuildContext context) {
    final screenControllerX = Get.put(ScreenControllerX());
    final langSelectorX = Get.put(LangSelector());


    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for(int i=0;i<=category.sub_category_list.length-1;i++)
          InkWell(
            onTap: ()async{
              screenControllerX.setIndex(5);
              productX.getProducts(
                  category.sub_category_list[i].id,
                  0,category.sub_category_list[i].product_count
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if(langSelectorX.istklang.value==false)Text(category.sub_category_list[i].name_tk,style: AppColor.headlinebluegray,),
                  if(langSelectorX.istklang.value==true)Text(category.sub_category_list[i].name_ru,style: AppColor.headlinebluegray,),
                       Container(
                         width: 35,
                           decoration: BoxDecoration(
                               border: Border.all(
                                 color: AppColor.greenlight,
                               ),
                               borderRadius: BorderRadius.all(Radius.circular(35))
                           ),
                           child: Center(child: Text(category.sub_category_list[i].product_count.toString(),style: AppColor.headlinebluegray,))
                       )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
