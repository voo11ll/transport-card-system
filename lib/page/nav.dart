import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transcard/page/home.dart';
import 'package:transcard/page/profile.dart';
import 'package:transcard/page/services.dart';

class Nav extends StatefulWidget {
  static String routeName = '/nav';

  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _pages = [const Home(), const Services(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changePage,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xffa29f9d),
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              color: Color(0xFF35363a),
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card_outlined,
              color: Color(0xffa29f9d),
            ),
            activeIcon: Icon(Icons.credit_card_rounded),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              color: Color(0xffa29f9d),
            ),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Профиль',
          ),
        ],
        selectedLabelStyle: GoogleFonts.nunito(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: const Color(0xFF212121),
        unselectedLabelStyle: GoogleFonts.nunito(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        unselectedItemColor: const Color(0xffa29f9d),
      ),
    );
  }
}