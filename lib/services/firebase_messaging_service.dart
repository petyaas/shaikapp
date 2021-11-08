import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shaikapp/getX/ProfileX.dart';

// import '../../common/ui.dart';
// import '../modules/messages/controllers/messages_controller.dart';
// import '../modules/root/controllers/root_controller.dart';
// import '../routes/app_routes.dart';
// import 'auth_service.dart';

class FireBaseMessagingService extends GetxService {
  Future<FireBaseMessagingService> init() async {
    NotificationSettings settings =await FirebaseMessaging.instance.requestPermission(sound: true, badge: true, alert: true);
    // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(sound: true, badge: true, alert: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    }else{print('User declined or has not accepted permission');}

    firebaseCloudMessagingListeners();
    setDeviceToken();
    return this;
  }

  void firebaseCloudMessagingListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data['title']);
      print(message.data['body']);
      // // if (Get.isRegistered<RootController>()) {
      // //   Get.find<RootController>().getNotificationsCount();
      // // }
      // if (message.data['id'] == "App\\Notifications\\NewMessage") {
      //   // _newMessageNotification(message);
      // } else {
      //   // _defaultNotification(message);
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      print(message.data['title']);
      print(message.data['body']);
      // if (message.data['id'] == "App\\Notifications\\NewMessage") {
      //   if (Get.isRegistered<RootController>()) {
      //     Get.find<RootController>().changePage(2);
      //   }
      // } else {
      //   if (Get.isRegistered<RootController>()) {
      //     Get.find<RootController>().changePage(1);
      //   }
      // }
    });
  }

  Future<String> setDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    // Get.log('token-'+token!);
    print('token-'+token!);

    if(
    (Get.find<ProfileX>().user.value.id!='')
    &&
    (token!=null)
    &&
    (Get.find<ProfileX>().user.value.devicetoken!=token)
    ){
      Get.find<ProfileX>().user.value.devicetoken=token;
      Get.find<ProfileX>().setTokenUser(Get.find<ProfileX>().user.value.id, token);
    }
    if(token!=null){Get.find<ProfileX>().user.value.devicetoken=token;}
    else{Get.find<ProfileX>().user.value.devicetoken='tokenNull';}

    return
      Get.find<ProfileX>().user.value.devicetoken;
  }
  Future<String?> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  // void _defaultNotification(RemoteMessage message) {
  //   RemoteNotification notification = message.notification;
  //   Get.showSnackbar(Ui.notificationSnackBar(
  //     title: notification.title,
  //     message: notification.body,
  //   ));
  // }
  //
  // void _newMessageNotification(RemoteMessage message) {
  //   RemoteNotification notification = message.notification;
  //   print(message.data);
  //   if (Get.find<MessagesController>().initialized) {
  //     Get.find<MessagesController>().refreshMessages();
  //   }
  //   if (Get.currentRoute != Routes.CHAT) {
  //     Get.showSnackbar(Ui.notificationSnackBar(
  //       title: notification.title,
  //       message: notification.body,
  //     ));
  //   }
  // }
}
