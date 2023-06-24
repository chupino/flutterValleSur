import 'package:apitest3/pages/home/bookings.dart';
import 'package:apitest3/pages/home/index.dart';
import 'package:apitest3/pages/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/dimension_constants.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  static const routeName = '/main_app';

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.navBarColor,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        selectedItemColor: ColorPalette.navBarSelectedColor,
        unselectedItemColor: ColorPalette.navBarUnselectedColor,
        selectedColorOpacity: 0.2,
        margin: EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: Text("Inicio"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.bookJournalWhills,
              size: kDefaultPadding,
            ),
            title: Text("Mis Reservas"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: Text("Perfil"),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeApp(),
          ReservasPage(),
          profilePage()
        ],
      ),
    );
  }
}