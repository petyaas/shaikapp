import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'Storage.dart';

class LangSelector extends GetxController{
  Rx<String> lang=''.obs;
  Rx<String> flag=''.obs;
  Rx<String> langcode=''.obs;
  Rx<String> countrycode=''.obs;
  Rx<String> langtext=''.obs;
  RxBool istklang=false.obs;

  @override
  void onInit()async {
    String locale=await LocalStorage().getCurrentLocale();

    if(locale==''){
      lang.value='tk_TK';
      flag.value='assets/icons/tkflag.png';
      langcode.value='tk';
      countrycode.value='TK';
      langtext.value='Turkmen';
      istklang.value=false;
    }else{
      if(locale=='ru_RU'){
        lang.value='ru_Ru';
        flag.value='assets/icons/russianflag.png';
        langcode.value='ru';
        countrycode.value='RU';
        langtext.value='Руский';
        istklang.value=true;
      }
      if(locale=='tk_TK'){
        lang.value='tk_TK';
        flag.value='assets/icons/USAflag.png';
        langcode.value='tk';
        countrycode.value='TK';
        langtext.value='Turkmen';
        istklang.value=false;
      }
    }
     Get.updateLocale(Locale(langcode.value,countrycode.value));
    print(langcode.value+'-'+countrycode.value);
    super.onInit();
  }

  void setlang(bool b){
istklang.value=b;
if(istklang==false)
  {setlanguage('tk_TK');}
else{
  setlanguage('ru_RU');
    }
  }
  void setlanguage(String text)async{
    if(text=='ru_RU'){
      lang.value='ru_Ru';
      flag.value='assets/icons/ruflag.png';
      langcode.value='ru';
      countrycode.value='RU';
      langtext.value='Руский';
    }
    if(text=='tk_TK'){
      lang.value='tk_TK';
      flag.value='assets/icons/tkflag.png';
      langcode.value='tk';
      countrycode.value='TK';
      langtext.value='Turkmen';
    }
   await LocalStorage().getCurrentLocale();
    Get.updateLocale(Locale(langcode.value,countrycode.value));
  }

}