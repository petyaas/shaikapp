import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shaikapp/widgets/carousel.dart';
import 'package:shaikapp/widgets/categors.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(color: AppColor.backgroundcolorgrey,
                onPressed: (){
                },
                icon: FaIcon(FontAwesomeIcons.phone),
                iconSize: 24,),
              IconButton(color: AppColor.backgroundcolorgrey,
                onPressed: (){
                //GetData().getSliderLIst();
                },
                icon: FaIcon(FontAwesomeIcons.search),
                iconSize: 24,),
            ],
            title: Container(
              width: 120,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                  'assets/logos/shaik.svg',
                  semanticsLabel: 'Acme Logo'
              ),
            ),
          ),
          body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoruselImages(),
              Container(
                height: 30,
                  child: Center(child: Text('Görnişler!',style: TextStyle(fontSize: 20),),)
              ),
              Container(
                height: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Categories(index: 0,),
                      Categories(index: 1,),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Categories(index: 2,),
                      Categories(index: 3,),
                    ],
                  )),
            ],
          ),
          );

  }
}
