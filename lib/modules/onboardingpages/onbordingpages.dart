import 'package:ecomm_app/modules/onboardingpages/cubit/cubit/onboardingcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/componants/componanats.dart';
import '../Login/loginpage.dart';

class OnboaringPages extends StatefulWidget {
  @override
  OnboaringPagesSates createState() => OnboaringPagesSates();
}

class OnboaringPagesSates extends State<OnboaringPages> {
  PageController appPageController = PageController();
  int current_page_index = 0;
  // const OnboaringPages({Key? key}) : super(key: key);
  List<Widget> appOnboardingPages = [
    OnboardongPagBuilder('assets/images/board1.png', 'Board1',
        'all categories that matches your preferences placed here just in fec taps you will get it right moment .'),
    OnboardongPagBuilder('assets/images/board2.png', 'Board2', ''),
    OnboardongPagBuilder('assets/images/board3.png', 'Board3', ''),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<OnboardingcubitCubit>(
      create: (context) => OnboardingcubitCubit(),
      child: Builder(builder: (cc) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar:
                AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
              TextButton(
                  onPressed: () {
                    BlocProvider.of<OnboardingcubitCubit>(cc)
                        .CancelOnboardingPage();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (cc) => LoginPage()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ))
            ]),
            body: Column(children: [
              Expanded(
                flex: 9,
                child: Container(
                  //color: Colors.red,
                  //height: MediaQuery.of(context).size.height ,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() => current_page_index = index);
                      },
                      controller: appPageController,
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          appOnboardingPages[index]),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      SmoothPageIndicator(
                          effect: ExpandingDotsEffect(
                              dotHeight: 15,
                              dotWidth: 15,
                              activeDotColor: Colors.amber),
                          controller: appPageController,
                          count: appOnboardingPages.length),
                      Spacer(),
                      FloatingActionButton(
                          backgroundColor: Colors.amber,
                          onPressed: () async {
                            if (current_page_index !=
                                appOnboardingPages.length - 1) {
                              appPageController.nextPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOutBack);
                            } else {
                              BlocProvider.of<OnboardingcubitCubit>(cc)
                                  .CancelOnboardingPage();
                              Navigator.of(cc).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ))
                    ]),
                  ))
            ]));
      }),
    ));
  }
}
