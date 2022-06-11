import 'package:ecomm_app/modules/shophome/cubit/cubit/shophomepagecubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/shophomepagecubit_state.dart';

class ShopHomePage extends StatelessWidget {
  // const ShopHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ShophomepageCubit>(
        create: (context) => ShophomepageCubit(),
        child: Scaffold(
            bottomNavigationBar:
                BlocBuilder<ShophomepageCubit, ShophomepagecubitStates>(
              builder: (context, state) {
                return BottomNavigationBar(
                    currentIndex: BlocProvider.of<ShophomepageCubit>(context)
                        .currentIndex,
                    onTap: (index) {
                      BlocProvider.of<ShophomepageCubit>(context)
                          .ChangePageIndex(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: '', icon: Icon(Icons.home)),
                      BottomNavigationBarItem(
                          label: '', icon: Icon(Icons.category)),
                      BottomNavigationBarItem(
                          label: '', icon: Icon(Icons.favorite)),
                      BottomNavigationBarItem(
                          label: '', icon: Icon(Icons.settings)),
                    ]);
              },
            ),
            body: BlocProvider.of<ShophomepageCubit>(context).SelectedPage()),
      ),
    );
  }
}
