import 'package:bloc/bloc.dart';
import 'package:ecomm_app/modules/onboardingpages/cubit/cubit/onboardingcubit_state.dart';
import 'package:ecomm_app/shared/network/local/shared_pref.dart';

class OnboardingcubitCubit extends Cubit<OnboardingcubitState> {
  OnboardingcubitCubit() : super(OnboardingcubitInitial());
  CancelOnboardingPage() {
    //isFirstOpen = false;
    AppCacheSettings.cacheObject
        .setBool('isFisrtTimeOpen', false)
        .then((value) {
      print('nahit say');
      emit(OnboardingCanceled());
    });
  }
}
