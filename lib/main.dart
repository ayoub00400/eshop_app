import 'package:ecomm_app/modules/Login/cubit/loginpagecubit.dart';
import 'package:ecomm_app/shared/network/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_layout/home_layout.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  //const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginPageCubit(),
        child: MaterialApp(
            theme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 133, 19),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        )))),
            debugShowCheckedModeBanner: false,
            home: FutureBuilder<SharedPreferences>(
                future: AppCacheSettings.Cache_Intialisation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeLayout();
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
  }
}
