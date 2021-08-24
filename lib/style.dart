import 'package:flutter/material.dart';
class AppColor {
  static const Color gold = Color.fromRGBO(247, 200, 115, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
 static const Color backgroundcolor=Color(0xFF0C0F1B);
 static const Color backgroundcolorgrey=Color(0xFF212A48);
 static const Color productshadow=Color(0xFF212A48);
 static const Color productprice=Color(0xFFEA7844);
 static const Color laghtBlueGray=Color(0xFF4C5166);
 static const Color ticketbackgruond=Color(0xFF080B15);

 static const Color green=Color.fromRGBO(116,177,62,1);
 static const Color greenlight=Color(0xFF3ACC7E);
 static const Color red=Color(0xFFE8503A);
 static const Color grey=Color(0XFF5F688A);
 static const Color greyblue=Color(0XFF6879B2);
 static const Color dark=Color(0XFF212A48);
 static const List<Color> gradient=[Color(0xFFF1D87E),Color(0xFFDA5E43),];




 static const TextStyle headlinegold=TextStyle(color: AppColor.gold,
        fontWeight: FontWeight.w500,fontFamily: "Euclid");
 static const TextStyle headlinegoldlight=TextStyle(color: AppColor.gold,fontWeight: FontWeight.w300,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinewhite=TextStyle(color: AppColor.white,fontWeight: FontWeight.w500,fontSize: 24,letterSpacing: 0,fontFamily: "Euclid");
  static const TextStyle miniwhite=TextStyle(color: AppColor.white,fontWeight: FontWeight.w500,fontSize: 14,letterSpacing: 0,fontFamily: "Euclid");
  static const TextStyle headlinegrey=TextStyle(color: AppColor.grey,fontWeight: FontWeight.w500,fontSize: 12,height: 2,fontFamily: "Euclid");
  static const TextStyle headlinewhite1=TextStyle(color: AppColor.white,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: "Euclid");
  static const TextStyle headlinewhitebold=TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Euclid");
  static const TextStyle headlinewhitebol2=TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinegreenbol2=TextStyle(color: AppColor.green,fontWeight: FontWeight.w600,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinegreenbol1=TextStyle(color: AppColor.green,fontWeight: FontWeight.w600,fontSize: 18,fontFamily: "Euclid");
  static const TextStyle headlinegreenbold1=TextStyle(color: AppColor.greenlight,fontWeight: FontWeight.w600,fontSize: 20,fontFamily: "Euclid");
  static const TextStyle headlinewhitelight2=TextStyle(color: AppColor.white,fontWeight: FontWeight.w400,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinebluegray2=TextStyle(color: AppColor.backgroundcolorgrey,fontWeight: FontWeight.w300,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinebluegray1=TextStyle(color: AppColor.backgroundcolorgrey,fontWeight: FontWeight.w400 ,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinebluegray=TextStyle(color: AppColor.backgroundcolorgrey,fontWeight: FontWeight.w500 ,fontSize: 16,fontFamily: "Euclid");
  static const TextStyle headlinebluegraybold=TextStyle(color: AppColor.backgroundcolorgrey,fontWeight: FontWeight.w800 ,fontSize: 20,fontFamily: "Euclid");
  static const TextStyle productpricetext=TextStyle(color: AppColor.productprice,fontWeight: FontWeight.w500 ,fontSize: 16,fontFamily: "Euclid");
  static const TextStyle
  productOldPriceText=
  TextStyle(
      color: AppColor.laghtBlueGray,
      fontWeight: FontWeight.w500 ,
      fontSize: 12,
      decoration: TextDecoration.lineThrough,
      fontFamily: "Euclid");
  static const TextStyle bottomNavBarText=TextStyle(color: AppColor.backgroundcolorgrey,fontWeight: FontWeight.w500 ,fontSize: 14,fontFamily: "Euclid");
  static const TextStyle headlinewhitelight3=TextStyle(color: AppColor.white,fontWeight: FontWeight.w300,fontSize: 8,fontFamily: "Euclid");
  static const TextStyle headlinewhitelight=TextStyle(color: AppColor.white,fontWeight: FontWeight.w300,fontFamily: "Euclid");
  static const TextStyle headlinewhitelight1=TextStyle(color: AppColor.white,fontWeight: FontWeight.w300,fontSize: 16, fontFamily: "Euclid");
  static const TextStyle productStatus=TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontSize: 16, fontFamily: "Euclid");

  static getThemeData() => ThemeData(

    errorColor: Colors.red,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary:Color.fromRGBO(47, 51, 57, 1),
        textStyle: TextStyle(fontFamily: "Euclid",),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: backgroundcolorgrey,
      ),
      backgroundColor:Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.gold,     //  <-- dark color
     textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
//        height: 1,
        fontFamily: "Euclid",
        fontWeight: FontWeight.w500,
      ),
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        height: 3,
        fontFamily: "Euclid",
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontFamily: "Euclid",
        fontWeight: FontWeight.w100,
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFF2F2F2),
    primaryColorLight: Color.fromRGBO(47, 51, 57, 1),
    accentColor: Color.fromRGBO(247, 200, 115, 1),
  );
}

