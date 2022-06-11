import 'dart:async';

import 'package:ecomm_app/modules/register/cubit/registrationpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/componants/componanats.dart';
import '../shophome/shophomepage.dart';
import 'cubit/registrationpage_state.dart';

class RegisterPage extends StatelessWidget {
  // const RegisterPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegistrationpageCubit(),
        child: Builder(builder: (ctx) {
          return SafeArea(
              child: Scaffold(
                  body: BlocListener<RegistrationpageCubit,
                          RegistrationpageState>(
                      listener: (ctx, state) {
                        if (state is RegistrationSuccess) {
                          if (state.status) {
                            Fluttertoast.showToast(
                                toastLength: Toast.LENGTH_SHORT,
                                msg: state.message,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                backgroundColor: Colors.black.withOpacity(.3));
                            Timer(Duration(seconds: 1),
                                () => Navigator.of(ctx).pop());
                          } else {
                            Fluttertoast.showToast(
                                toastLength: Toast.LENGTH_SHORT,
                                msg: state.message,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                backgroundColor: Colors.black.withOpacity(.3));
                          }
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    icon: Icon(Icons.arrow_back_ios_new)),
                                Spacer()
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Signup ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  TextFieldBuilder(
                                      ctx,
                                      nameController,
                                      'Full Name ',
                                      Icon(Icons.person),
                                      null,
                                      false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldBuilder(
                                      ctx,
                                      emailController,
                                      'Email Adress',
                                      Icon(Icons.email),
                                      null,
                                      false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldBuilder(
                                      ctx,
                                      passwordController,
                                      'Password',
                                      Icon(Icons.lock),
                                      null,
                                      false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldBuilder(
                                      ctx,
                                      passwordController,
                                      'Confirme Password',
                                      Icon(Icons.lock),
                                      null,
                                      false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFieldBuilder(ctx, phoneController,
                                      'phone', Icon(Icons.phone), null, false),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Button_Builder(
                                      buttonText: 'Register',
                                      buttonFunc: () {
                                        BlocProvider.of<RegistrationpageCubit>(
                                                ctx)
                                            .RegisterNewUser(
                                                name: nameController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                phone: phoneController.text);
                                      }),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ))));
        }));
  }
}
