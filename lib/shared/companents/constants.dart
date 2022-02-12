


import '../../modules/shop_app/login/shop_login_screen.dart';
import '../network/local/cache_helper.dart';
import 'companents.dart';
String token = CacheHelper.getData(key: 'token');
String uId = CacheHelper.getData(key: 'uId');
void signOut(context)
{

  CacheHelper.removeData(key: 'token').then((value) {
    if(value){

      token= '';
      navigateAndFinish(context,
        ShopLoginScreen(),
      );
    }
  });
}

void printFullText(String text)
{
  final pattern =RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

