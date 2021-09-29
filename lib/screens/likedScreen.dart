import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/iconMessage.dart';
import 'package:shaikapp/widgets/productMini.dart';
class LikedScreen extends StatelessWidget {
  final productX = Get.put(ProductX());
  final profileX = Get.put(ProfileX());

  @override
  Widget build(BuildContext context) {
    productX.getByListId(productX.likeList.value);
    return FadeInDownBig(
        duration: Duration(milliseconds: 100),
        child: Obx((){
          if(profileX.user.value.phone!='')
            {
              if((productX.byListIdStatus.value==xStatus.empty)){
                return IconMessage(icon:FontAwesomeIcons.heart,text:DefText.emptyLikeList.tr);

              }
              if(productX.byListIdStatus.value==xStatus.loading){
                return Center(child: CircularProgressIndicator(),);
              }
              if(productX.byListIdStatus.value==xStatus.error) {
                return Center(child: IconMessage(icon:FontAwesomeIcons.globe,text:DefText.unknownError.tr),);
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

            }
          else{
            return Center(child: IconMessage(icon:FontAwesomeIcons.signInAlt,text:DefText.signinpls.tr));
          }

          return Center(child: IconMessage(icon:FontAwesomeIcons.globe,text:'DefText.unknownError.tr'));
        }),
    );
  }
}
