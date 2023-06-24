import 'package:apitest3/controller/onBoardController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/main.dart';
import 'package:apitest3/pages/start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apitest3/models/onboard_page_item.dart';
import 'package:apitest3/components/fading_sliding_widget.dart';
import 'package:apitest3/pages/start/welcomeOnboard.dart';
import 'package:apitest3/pages/start/onboard_page.dart';
import 'package:page_transition/page_transition.dart';


class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  List<OnboardPageItem> onboardPageItems = [
    OnboardPageItem(
      lottieAsset: 'assets/animations/easy2.json',
      text: 'Realizar reservas es muy fácil', animationDuration: Duration(seconds: 7),
    ),
    OnboardPageItem(
      lottieAsset: 'assets/animations/support.json',
      text: 'Soporte Tecnico de buena calidad',
      animationDuration: const Duration(seconds: 2),
    ),
    OnboardPageItem(
      lottieAsset: 'assets/animations/payment.json',
      text: 'Pagos seguros',
      animationDuration: const Duration(seconds: 2)
    ),
  ];

  late PageController _pageController;

  List<Widget> onboardItems = [];
  late double _activeIndex;
  bool onboardPage = false;
  late AnimationController _animationController;

  @override
  void initState() {
    initializePages(); //initialize pages to be shown
    _pageController = PageController();
    _pageController.addListener(() {
      _activeIndex = _pageController.page!;
      print("Active Index: $_activeIndex");
      if (_activeIndex >= 0.5 && onboardPage == false) {
        setState(() {
          onboardPage = true;
        });
      } else if (_activeIndex < 0.5) {
        setState(() {
          onboardPage = false;
        });
      }
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    super.initState();
  }

  initializePages() {
    onboardItems.add(WelcomePage()); // welcome page
    onboardPageItems.forEach((onboardPageItem) {
      //adding onboard pages
      onboardItems.add(OnboardPage(
        onboardPageItem: onboardPageItem,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final OnBoardController controller=Get.put(OnBoardController());
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              children: onboardItems,
            ),
          ),
          Positioned(
            bottom: height * 0.15,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardItems.length,
              effect: WormEffect(
                dotWidth: width * 0.03,
                dotHeight: width * 0.03,
                dotColor: onboardPage
                    ? Color.fromARGB(255, 171, 170, 170)
                    : const Color(0x566FFFFFF),
                activeDotColor: onboardPage
                    ? const Color(0xFF9544d0)
                    : const Color(0xFFFFFFFF),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                //Get.toNamed("/welcome");
                controller.finishOnBoard();
                /* Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftPop,child: welcomeScreen(),childCurrent: Onboard())); */
              },
              child: FadingSlidingWidget(
                animationController: _animationController,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: Alignment.center,
                  width: width * 0.8,
                  height: height * 0.075,
                  child: Text(
                    'Vamos',
                    style: TextStyle(
                      color: onboardPage
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF220555),
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                    gradient: LinearGradient(
                      colors: onboardPage
                          ? [
                              const Color(0xFF8200FF),
                              const Color(0xFFFF3264),
                            ]
                          : [
                              const Color(0xFFFFFFFF),
                              const Color(0xFFFFFFFF),
                            ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}