import 'package:ecomm_app/modules/Login/loginpage.dart';
import 'package:ecomm_app/modules/shophome/shophomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/onboardingpages/onbordingpages.dart';
import '../shared/network/local/shared_pref.dart';

class HomeLayout extends StatelessWidget {
  //const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AppCacheSettings.cacheObject.getBool('isFisrtTimeOpen').toString());
    return (AppCacheSettings.cacheObject.getBool('isFisrtTimeOpen') == true)
        ? OnboaringPages()
        : (AppCacheSettings.cacheObject.getString('token') != null
            ? ShopHomePage()
            : LoginPage());
  }
}
