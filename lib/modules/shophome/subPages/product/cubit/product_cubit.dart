import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecomm_app/modules/shophome/subPages/product/cubit/product_state.dart';
import 'package:ecomm_app/shared/network/remote/diohelper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../models/shophomemodels/shopmodels.dart';
import '../../../../../shared/network/local/shared_pref.dart';


class ProductCubit extends Cubit<ProductState> {
  late ShopApiDataResponse response;
  ProductCubit() : super(ProductInitial());


  GetHomepageData(){
    emit(HomePageLoading());
    DioHelper.dioHelperObject.get('home',options:Options(headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':AppCacheSettings.cacheObject.getString('token'),

    })).then((value){

      response = ShopApiDataResponse.FromJson(value.data);
      emit(HomePageLoaded());

    });



  }
}
