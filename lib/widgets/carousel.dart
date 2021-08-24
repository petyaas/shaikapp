import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/sliderX.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/models/slider_list.dart';
import 'package:get/get.dart';
class CoruselImages extends StatelessWidget {
  final sliderX = Get.put(SliderGetX());

  @override
  Widget build(BuildContext context) {

    List<Widget>? imageList(List<SliderList> data){
      List<Widget>? _temp=[];
      data.forEach((element) {
        print('data='+element.img_tk);
        _temp.add(
            Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      // Image.network(item, fit: BoxFit.cover, width: 1000,),
                      Center(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,width: 1000,
                          // imageUrl: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                          imageUrl: ApiLinks.host+element.img_tk,
                          placeholder: (context, url) => Container(
                            // width: 50,height: 50 ,
                              child: Center(child: CircularProgressIndicator())
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ],
                  )),
            )
        );

      });
return _temp;
    }

    return Obx(()
    {
      if(sliderX.status.value==xStatus.empty){
        return Center(child: Text('Empty...'));
      }
      if(sliderX.status.value==xStatus.loading){
        return Center(child: CircularProgressIndicator(),);
      }
      if(sliderX.status.value==xStatus.loaded){
        return
            CarouselSlider(
              options: CarouselOptions(
                height: (MediaQuery.of(context).size.height-60)*0.35,
                viewportFraction: 1,
                // aspectRatio:1.0,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                disableCenter: false,
                autoPlay: true,
              ),
              items: imageList(sliderX.listOfSliders!.value),
            );
      }
      return Text('Error...');
    });
  }

}

