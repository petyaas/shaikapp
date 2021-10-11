import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/style.dart';
import 'package:shaikapp/widgets/ButtonCustom.dart';
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
                  Stack(
                    children: [
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
                      ),
                      if(productX.checkBagNotify.value==true)
                        Container(
                            // height: MediaQuery.of(context).size.height,
                            height: MediaQuery.of(context).size.height,
                          color: AppColor.trasnparent,
                            child: Center(
                              child: Container(
                                //color: Colors.red,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                height: 400,
                                  width: MediaQuery.of(context).size.width*0.95,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(DefText.alert.tr,style: AppColor.headlinebluegray,textAlign: TextAlign.center,),
                                        ),
                                      ),
                                      Expanded(child: Notifylist()),
                                      Divider(color: AppColor.backgroundcolorgrey,),
                                      Center(
                                        child: Container(
                                          width: 200,
                                          child: ButtonCustom(
                                            text: DefText.apply.tr,
                                            icon: FontAwesomeIcons.checkCircle,
                                            align: TextAlign.center,
                                            onTap: () {
                                              productX.addBagNotify(profileX.user.value.id);
                                            },),
                                        ),
                                      ),
                                    ],
                                  )),
                            )),

                    ],
                  );
                //ProductMini(product: productX.listOfProducts![0],);
              }

            }
          else{
            return Center(child: IconMessage(icon:FontAwesomeIcons.signInAlt,text:DefText.signinpls.tr));
          }

          return Center(child: IconMessage(icon:FontAwesomeIcons.globe,text:DefText.unknownError.tr));
        }),
    );
  }
}

class Notifylist extends StatelessWidget {
  final productX = Get.put(ProductX());
  final profileX = Get.put(ProfileX());
 List<Widget> _list=[];
  @override
  Widget build(BuildContext context) {
    productX.bagList.value.forEach((element) {
      if((element.oldamount!=-1)||(element.oldprice!=-1))
        {
          for(int i=0;i<=productX.listOfProducts!.value.length-1;i++)
            {
              if(productX.listOfProducts!.value[i].id==element.product_id)
                {
                  _list.add(
                  Container(
                    margin: EdgeInsets.all(3),
                    color: Colors.white,
                    height: 150,
                    child:
                        Row(
                          children: [
                            Container(
                              width: 130,
                              child: CachedNetworkImage(imageUrl: ApiLinks.host+productX.listOfProducts!.value[i].img_tk.little),
                            ),
                            Expanded(
                              child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  AutoSizeText(productX.listOfProducts!.value[i].code+'('+productX.listOfProducts!.value[i].analog_tk+')',minFontSize: 12,maxLines: 2,style: AppColor.headlinebluegray,),
                                  if(element.oldamount!=-1)
                                  AutoSizeText(DefText.newProductamount.tr+'-'+element.amount.toString(),minFontSize: 12,maxLines: 2,style: AppColor.headlinebluegray,),
                                  if(element.oldprice!=-1)
                                  AutoSizeText(DefText.isNewPrice.tr+'-'+element.price.toString()+' TMT',minFontSize: 12,maxLines: 2,style: AppColor.headlinebluegray,),

                                ],
                              ),
                            )
                          ],
                        ),
                  )
                  );

                }

            }
        }
    });
    return ListView(
      children: _list,
    );
  }
}
