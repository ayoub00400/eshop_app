import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'cubit/product_cubit.dart';
import 'cubit/product_state.dart';

class ProductsPage extends StatelessWidget {
  //const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(create: ((context) => ProductCubit()),child:
    
    
    
    
    
    BlocBuilder< ProductCubit,ProductState> (builder: ((context, state) {
          if(state is HomePageLoading){
          return Center(child: CircularProgressIndicator(),);
          }else{
              return Column(children: [

CarouselSlider(items:BlocProvider.of<ProductCubit>(context).response.banners.map((e) => Image(image:e.image)).toList(),options:CarouselOptions(scrollPhysics:BouncingScrollPhysics(),autoPlay: true,autoPlayCurve:Curves.easeInOut ,enlargeCenterPage: true ) ,)

    ],);

          }
    })));
    
    
    
    
    
  }
}
