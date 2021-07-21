import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaikapp/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shaikapp/widgets/carousel.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(color: AppColor.backgroundcolorgrey,
            onPressed: (){},
            icon: FaIcon(FontAwesomeIcons.phone),
            iconSize: 24,),
          IconButton(color: AppColor.backgroundcolorgrey,
              onPressed: (){},
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
        body: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height-60)*0.3,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                )),
            Divider(color: Colors.grey,),
            Container(
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        child:
                        Column(
                          children: [
                            Container(
                              height:50,width: 70,
                              child: SvgPicture.asset(
                                  'assets/icons/man.svg',
                                  semanticsLabel: 'Acme Logo'
                              ),
                            ),
                            Text('man',style: AppColor.headlinebluegray1,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        child:
                        Column(
                          children: [
                            Container(
                              height:50,width: 70,
                              child: SvgPicture.asset(
                                  'assets/icons/women.svg',
                                  semanticsLabel: 'Acme Logo'
                              ),
                            ),
                            Text('woman',style: AppColor.headlinebluegray1,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        child:
                        Column(

                          children: [
                            Container(
                              height:50,width: 70,
                              child: SvgPicture.asset(
                                  'assets/icons/unisex.svg',
                                  semanticsLabel: 'Acme Logo'
                              ),
                            ),
                            Text('unisex',style: AppColor.headlinebluegray1,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        child:
                        Column(

                          children: [
                            Container(
                              height:50,width: 70,
                              child: SvgPicture.asset(
                                  'assets/icons/kids.svg',
                                  semanticsLabel: 'Acme Logo'
                              ),
                            ),
                            Text('kids',style: AppColor.headlinebluegray1,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        child:
                        Column(

                          children: [
                            Container(
                              height:50,width: 70,
                              child: SvgPicture.asset(
                                  'assets/icons/diffuser.svg',
                                  semanticsLabel: 'Acme Logo'
                              ),
                            ),
                            Text('diffuser',style: AppColor.headlinebluegray1,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ),

          ],
        ));
  }
}
