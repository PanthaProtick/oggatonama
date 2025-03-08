import 'package:flutter/material.dart';
import 'package:oggatonama/drawer.dart';
import 'package:oggatonama/home_page.dart';
import 'package:oggatonama/report_body.dart';
import 'package:oggatonama/claim_body.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<String> screenNames = [
    'Oggatonama', 'Report Found Body', 'Claim Reported Body'
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(),
      ReportPage(),
      ClaimBodyPage()
    ];
    return Scaffold(
      backgroundColor: Color(0xFF1D1616),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          screenNames[_currentIndex],
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 26,
          color: Colors.white
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(child: screens[_currentIndex]),
       bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconSize: 30,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Claim Body',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.pending_actions),
              icon: Icon(Icons.pending_actions_rounded),
              label: 'Report Body',
            ),
          ],
       )
    );
  }
}
