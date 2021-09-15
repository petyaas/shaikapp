import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/events.dart';
class ScreenControllerX extends GetxController{
  Rx<xScreen> screen=xScreen.homepage.obs;
  RxInt screenIndex=0.obs;
  RxString testString='init'.obs;
  final FirebaseMessaging fm = FirebaseMessaging as FirebaseMessaging;
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    if((message!=null)&&(message.notification!.body=='dada'))
    {
      testString.value=message.notification!.body!;
      setIndex(3);
    }
    print("onBackgroundMessage: $message");
  }

  @override
  void onInit() async{
    inis();
    startFirebase();
    super.onInit();
  }
  void inis()async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

  }
  void startFirebase()async{

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!'+message.toString());
      testString.value=message.notification!.body!;
      if((message.notification!.body=='dada'))
      {

        setIndex(3);
      }

    });

  }

  void setIndex(int index){
    if(index==0){
      screenIndex.value=index;
      screen.value=xScreen.homepage;
    }
    if(index==1){
      screenIndex.value=index;
      screen.value=xScreen.category;
    }
    if(index==2){
      screenIndex.value=index;
      screen.value=xScreen.shopbag;
    }
    if(index==3){
      screenIndex.value=index;
      screen.value=xScreen.liked;
    }
    if(index==4){
      screenIndex.value=index;
      screen.value=xScreen.profil;
    }
    if(index==5){
      screenIndex.value=index;
      screen.value=xScreen.products;
    }
  }

}