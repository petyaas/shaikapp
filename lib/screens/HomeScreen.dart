import 'package:flutter/material.dart';
import 'package:shaikapp/widgets/carousel.dart';
import 'package:shaikapp/widgets/categors.dart';
import 'package:animate_do/animate_do.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return
      FadeInLeft(
        duration: Duration(milliseconds: 100),
        child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                    child: CoruselImages()),
              ],
            ),
      );


  }
}
