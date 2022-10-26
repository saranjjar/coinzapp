
import 'package:coinz/modules/Home/currency_%20alarm/currency%20_alarm_screen.dart';
import 'package:coinz/modules/Home/currency_price/currency_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'news_report/news_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen > {
  int _selectedIndex = 0;

List<Widget> screens= [

  CurrencyPriceScreen(),
  CurrencyAlarmScreen(),
  NewsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: [
                  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/Group.svg'),label: 'أسعار العملات'),
                  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/Bell.svg'),label: 'منبه العملات'),
                  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/Menu.svg'),label: 'أخبار وتقارير'),
            ],
          ),
      ),
    );
  }
}

