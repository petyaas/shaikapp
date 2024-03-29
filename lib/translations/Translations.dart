import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
class AppTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'ru_RU':{
      'NEW':'Новинка',
      'STOCKS':'Акция',
      'DISCOUNT':'Скидка',
      DefText.homePage:'Главная',
      DefText.categories:'Категории',
      DefText.shoppingBag:'Корзина',
      DefText.favorite:'Избранное',
      DefText.profile:'Профил',
      DefText.addToBag:'В корзину',
      DefText.signin:'Войти',
      DefText.signout:'Выйти',
      DefText.language:'Язык',
      DefText.delivered:'Заказы',
      DefText.paydelivery:'Условия доставки и оплаты',
      DefText.sendemail:'Обратная связь',
      DefText.info:'О нас',
      DefText.hassendsms:'Введите номер телефона',
      DefText.enterphonenumberas:'8 значный',
      DefText.send:'Отправить',
      DefText.entersendcode:'Введите код',
      DefText.entercode:'Код',
      DefText.checkcode:'Проверить',
      DefText.name:'Имя',
      DefText.phone:'Телефон',
      DefText.male:'Мужчина',
      DefText.famele:'Женщина',
      DefText.save:'Сохранить',
      DefText.yes:'Да',
      DefText.cancel:'Отмена',
      DefText.alert:'Внимание',
      DefText.signoutalert:'Вы действительно хотите выйти из акаунта?',
      DefText.alertdeleteBag:'Удалить продукт из корзины?',
      DefText.editprofiletrue:'Изменения сохранены!!!',
      DefText.editprofilefalse:'Ошибка!!!',
      DefText.payDelivery1:'На данный момент доставка предоставляется по городу Ашхабад;',
      DefText.payDelivery2:'Если сумма заказа превысит 150 манат, доставка бесплатно;',
      DefText.payDelivery3:'Услуга доставки выполняется по указанному Вами адресу и номеру телефона;',
      DefText.payDelivery4:'После Вашего заказа, оператор позвонит Вам для подтверждения заказа;',
      DefText.payDelivery5:'Если заказ не подтверждается, то данный заказ не регестрируется и не выполняется;',
      DefText.payDelivery6:'Заказы принятые между 08:00 - 18:00 доставляются в тот же день, заказы принятые после 18:00 доставляются на следующий день.',
      DefText.payDelivery7:'После того, как Вы проверите и примите заказ, оплата выполняется наличными в национальной валюте.',
      DefText.payDelivery8:'Принятый и оплаченный товар возврату не подлежит;',
      DefText.signinpls:'Войдите в акаунт!!!',
      DefText.nomuchproduct:'Максимальное количество!',
      DefText.emptyLikeList:'Еще не добавлено!!!',
      DefText.emptyBagList:'Корзина пуста!!!',
      DefText.unknownError:'Ошибка связи!',
      DefText.tryAgainError:'Повторите еще!',
      DefText.newProductamount:'Всего в корзине',
      DefText.apply:'Принять',
      DefText.isNewPrice:'Цена продукта изменено',
      DefText.totalPriceBag:'Сумма',
      DefText.priceIsSmall:'Доставка платная!',
      DefText.priceIsGood:'Доставка бесплатная!',
      DefText.nullproduct:'Нет в наличии!',
      DefText.adresses:'Адресы',
      DefText.adress:'Адрес доставки',
      DefText.toOrder:'Заказать',
      DefText.orderSent:'Заказ отправлен!',
      DefText.orderNotSent:'Ошибка повторите попытку!',
      DefText.deliveryNotSup:'Доставка временно не доступна!',
      DefText.delivertime:'Время доствки',
      DefText.toDay:'Сегодня',
      DefText.yesterday:'Завтра',
      DefText.deliveryNotSupDay:'Сегодня доставка больше недоступна!',
      DefText.oClock:'Время',
      DefText.topSales:'Самые продаваемые',
      DefText.topManSales:'Самые продаваемые(Мужские)',
      DefText.topUnisexSales:'Top Unisex',
      DefText.topWomanSales:'Самые продаваемые(Женские)',
      DefText.topChildSales:'Самые продаваемые(Детские)',
      DefText.deliverNotSup:'Самые продаваемые(Детские)',
      DefText.Rek1:'Качество товара',
      DefText.Rek2:'Стойкость до 48 часов',
      DefText.Rek3:'Быстрая доставка',
      DefText.Rek4:'Наличие товара',
      DefText.Rek0:'Наши преимущества',
},
    'tk_TK':{
      'NEW':'Täze',
      'STOCKS':'Aksiýa',
      'DISCOUNT':'Arzanladyş',
      DefText.homePage:'Baş Sahypa',
      DefText.categories:'Kategoriýalar',
      DefText.shoppingBag:'Sebet',
      DefText.favorite:'Halanlarym',
      DefText.profile:'Profil',
      DefText.addToBag:'Sebede goş',
      DefText.signin:'Ulgama girmek',
      DefText.signout:'Ulgamdan çykmak',
      DefText.language:'Dil',
      DefText.delivered:'Sargytlarym',
      DefText.sendemail:'Habarlaşmak',
      DefText.info:'Biz barada',
      DefText.hassendsms:'Telefon belginiz',
      DefText.enterphonenumberas:'8 belgi',
      DefText.send:'Ibermek',
      DefText.entersendcode:'Belga iberilen kod',
      DefText.entercode:'Kod',
      DefText.checkcode:'Barla',
      DefText.name:'Ady',
      DefText.phone:'Telefon',
      DefText.male:'Erkek',
      DefText.paydelivery:'Eltmek we töleg',
      DefText.famele:'Ayal',
      DefText.save:'Ýatda sakla',
      DefText.yes:'Hawa',
      DefText.cancel:'Goýbolsyn',
      DefText.alert:'Duýduryş',
      DefText.signoutalert:'Siz hakykatdanam ulgamdan çykmakçymy?',
      DefText.alertdeleteBag:'Harydy sebetden aýyrmakçymy?',
      DefText.editprofiletrue:'Ýatda saklandy!!!',
      DefText.editprofilefalse:'Ýalňyşlyk!!!',
      DefText.payDelivery1:'Harytlary eltip bermek hyzmaty häzirki wagtda Aşgabat şäheri boýunça amala aşyrylýar;',
      DefText.payDelivery2:'Her bir sargydyňyzyň bahasy 150 manatdan geçse, eltip bermek hyzmaty mugt;',
      DefText.payDelivery3:'Eltip bermek hyzmaty girizen salgyňyz we telefon belgiňiz esasynda amala aşyrylýar;',
      DefText.payDelivery4:'Sargyt edeniňizden soňra operator size jaň edip sargydy tassyklar;',
      DefText.payDelivery5:'Sargyt tassyklanmadyk ýagdaýynda ol hasaba alynmaýar we ýerine ýetirilmeýär;',
      DefText.payDelivery6:'08:00 - 18:00 aralygynda edilen sargytlar şol gün eltilýär, 18:00-dan soňky edilen sargytlar bolsa ertesi gün size gowşurylar',
      DefText.payDelivery7:'Sargydy barlap alanyňyzdan soňra töleg nagt görnüşde milli manatda amala aşyrylýar;',
      DefText.payDelivery8:'Kabul edip tölegini geçiren harydyňyz yzyna alynmaýar.',
      DefText.signinpls:'Ulgama girmeli!!!.',
      DefText.emptyLikeList:'Haryt goşulmadyk!!!',
      DefText.emptyBagList:'Sebede haryt goşylmadyk!!!',
      DefText.unknownError:'Internet näsazlygy!',
      DefText.tryAgainError:'Gaýtadan synanşyp göriň!',
      DefText.nomuchproduct:'Ammarda ýeterlik däl!',
      DefText.newProductamount:'Sebetdaki harydyň sany uytgedi',
      DefText.apply:'Düşnikli',
      DefText.isNewPrice:'Harydyň bahasy uýtgedi',
      DefText.totalPriceBag:'Jemi',
      DefText.priceIsSmall:'Saryt eltip bermek hyzmatydan pes!',
      DefText.priceIsGood:'Eltip bermek hyzmaty mugt!',
      DefText.nullproduct:'Satlykda ýok',
      DefText.adresses:'Salgylar',
      DefText.adress:'Salgy',
      DefText.toOrder:'Sargyt etmek',
      DefText.orderSent:'Sargyt iberildi!',
      DefText.orderNotSent:'Tehniki kemçilik täzeden synanşyp göriň!',
      DefText.deliveryNotSup:'Eltip bermek hyzmaty wagtlaýynça el ýeter däl!',
      DefText.delivertime:'Eltip bermeli wagty',
      DefText.toDay:'Şu gün',
      DefText.yesterday:'Ertir',
      DefText.deliveryNotSupDay:'Bu gunlikçe eltip berme hyzmaty elýeter däl!',
      DefText.oClock:'Sagat',
      DefText.topSales:'Köp satylanlar',
      DefText.topManSales:'Köp satylanlar(Erkek)',
      DefText.topWomanSales:'Köp satylanlar(Zenan)',
      DefText.topChildSales:'Köp satylanlar(Çagalar uçin)',
      DefText.topUnisexSales:'Top Unisex',
      DefText.Rek1:'Belli Brand',
      DefText.Rek2:'48 sagada çenli durnykly',
      DefText.Rek3:'Eltip bermek hyzmaty',
      DefText.Rek4:'Elýeter baha',
      DefText.Rek0:'Bizi saýlasaňyz',
    }
  };

}