import 'package:bloc/bloc.dart';
import 'package:ecomm_app/modules/shophome/subPages/settings.dart';
import 'package:flutter/material.dart';

import '../../subPages/categories.dart';
import '../../subPages/favorites.dart';
import '../../subPages/product/products.dart';
import 'shophomepagecubit_state.dart';

class ShophomepageCubit extends Cubit<ShophomepagecubitStates> {
  int currentIndex = 0;
  List<Widget> pages = [
    ProductsPage(),
    CategoriesPage(),
    FavoritesPage(),
    SettingsPage()
  ];
  ShophomepageCubit() : super(ShophomepagecubitInitial());

  ChangePageIndex(int index) {
    currentIndex = index;
    SelectedPage();
    emit(PageIndexChanged());
  }

  SelectedPage() {
    return pages[currentIndex];
  }
}
