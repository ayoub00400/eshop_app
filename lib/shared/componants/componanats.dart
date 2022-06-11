import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/Login/cubit/loginpagecubit.dart';
import '../../modules/Login/cubit/loginpagestates.dart';

Widget TextFieldBuilder(
  BuildContext context,
  TextEditingController textController,
  String hint,
  Icon prefIcon,
  dynamic sufIcon,
  bool hideText,
) {
  return TextFormField(
      obscureText: hideText,
      controller: textController,
      decoration: InputDecoration(
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        hintText: hint,
        prefixIcon: prefIcon,
        suffixIcon: sufIcon,
      ));
}

Widget Button_Builder(
    {required String buttonText, required Function buttonFunc}) {
  return MaterialButton(
      color: Colors.amber,
      height: 50,
      minWidth: 250,
      onPressed: () async {
        print('buttom pressed');
        buttonFunc();
      },
      child: Text(buttonText));
}

Widget OnboardongPagBuilder(String image_path, String title, String bodyText) {
  return Container(
      child: Column(children: [
    Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 20),
      child: Image(
        image: AssetImage(image_path),
        height: 260,
      ),
    ),
    Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 26),
      child: Container(
        width: double.infinity,
        //height: 200,
        //color: Colors.amberAccent,
        child: Text(
          bodyText,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black45,
            letterSpacing: .7,
          ),
        ),
      ),
    ),
  ]));
}
