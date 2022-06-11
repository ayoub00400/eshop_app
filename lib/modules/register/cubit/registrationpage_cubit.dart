import 'package:bloc/bloc.dart';
import 'package:ecomm_app/shared/network/remote/diohelper.dart';

import '../../../models/Loginmodels/loginmodels.dart';
import '../../../models/registermodels/registermodels.dart';
import '../../../shared/network/remote/endpoints.dart';
import 'registrationpage_state.dart';

class RegistrationpageCubit extends Cubit<RegistrationpageState> {
  late RegisterApiResponse response;
  RegistrationpageCubit() : super(RegistrationpageInitial());
  RegisterNewUser(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(RegistrationLoading());
    DioHelper.dioHelperObject.post(register, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      response = RegisterApiResponse.FromJson(value.data);
      emit(RegistrationSuccess(response.message, response.status));
    });
  }
}
