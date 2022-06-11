import 'package:ecomm_app/shared/network/remote/endpoints.dart';

import '../../../models/Loginmodels/loginmodels.dart';
import '../../../shared/network/local/shared_pref.dart';
import '../../../shared/network/remote/diohelper.dart';
import 'loginpagestates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class LoginPageCubit extends Cubit<LoginStates> {
  bool password_visibility = true;
  late LoginApiResponse response;
  LoginPageCubit() : super(InitialeState());

  ChangePasswordVisibilty() {
    if (password_visibility) {
      password_visibility = false;
    } else {
      password_visibility = true;
    }

    emit(PasswordVisibilityChanged());
  }

  PostLoginData(String email, String password) {
    emit(Loginloading());
    DioHelper.dioHelperObject.post(login,
        data: {'email': email, 'password': password}).then((value) {

      response = LoginApiResponse.FromJson(value.data);
      if(response.status==true){
          AppCacheSettings.cacheObject.setString('token', response.userData.token);
      }
      
      emit(LoginDoneSeccufuly(response.status));
    }).catchError((error) {
      print(error.toString());
      emit(LoginFailed());
    });
  }
}
