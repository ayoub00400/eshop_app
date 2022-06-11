import 'package:ecomm_app/modules/Login/cubit/loginpagecubit.dart';
import 'package:ecomm_app/modules/Login/cubit/loginpagestates.dart';
import 'package:ecomm_app/modules/register/cubit/registrationpage_cubit.dart';
import 'package:ecomm_app/shared/network/remote/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componants/componanats.dart';
import '../register/registerpage.dart';
import '../shophome/shophomepage.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageStates createState() => LoginPageStates();
}

class LoginPageStates extends State<LoginPage> {
  //const LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey myScaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    DioHelper.DioInit();

    return SafeArea(
      child: BlocListener<LoginPageCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginDoneSeccufuly) {
              if (state.status) {
                Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
                  builder: (BuildContext context) => ShopHomePage(),
                ));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text(BlocProvider.of<LoginPageCubit>(context)
                              .response
                              .message),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.amber),
                                ))
                          ],
                        ));
              }
            }
          },
          child: Scaffold(
            key: myScaffold,
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'LOGIN',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 35),
                          ),
                        ),
                        Text(
                          'to discover what\'s new today.',
                          style: TextStyle(color: Colors.black45, fontSize: 20),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFieldBuilder(
                                context,
                                emailController,
                                'Email Adress',
                                Icon(Icons.email),
                                null,
                                false)),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<LoginPageCubit, LoginStates>(
                            builder: ((context, state) => TextFieldBuilder(
                                  context,
                                  passwordController,
                                  'Password',
                                  Icon(Icons.lock),
                                  IconButton(
                                      onPressed: () {
                                        BlocProvider.of<LoginPageCubit>(
                                          context,
                                        ).ChangePasswordVisibilty();
                                      },
                                      icon: BlocProvider.of<LoginPageCubit>(
                                        context,
                                      ).password_visibility
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off)),
                                  BlocProvider.of<LoginPageCubit>(
                                    context,
                                  ).password_visibility,
                                )))
                      ])),
              SizedBox(
                height: 50,
              ),
              Button_Builder(
                  buttonText: 'LOGIN',
                  buttonFunc: () {
                    return BlocProvider.of<LoginPageCubit>(context)
                        .PostLoginData(
                            emailController.text, passwordController.text);
                  }),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange[900]),
                    ),
                  )
                ],
              )
            ]),
          )),
    );
  }
}
