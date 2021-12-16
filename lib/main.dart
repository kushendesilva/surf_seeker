import 'package:surf_seeker/screens/explore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [
    ExplorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() { _selectedPage = index; }),
        controller: _pageController,
        children: [
          ...pages
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.15)),
          ],
        ),
        height: 75,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: GNav(
                selectedIndex: _selectedPage,
                onTabChange: (index) => _onItemTapped(index),
                curve: Curves.easeOutExpo,
                gap: 5,
                activeColor: Colors.white,
                iconSize: 26,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 500),
                tabBackgroundColor: Colors.grey,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.black,
                    textColor: Colors.green,
                    backgroundColor: Colors.greenAccent.withOpacity(.2),
                  ),
                  GButton(
                    icon: LineIcons.circle,
                    text: 'Test',
                    iconActiveColor: Colors.lightBlue,
                    iconColor: Colors.black,
                    textColor: Colors.lightBlue,
                    backgroundColor: Colors.lightBlue.withOpacity(.2),
                  ),
                  GButton(
                    icon: LineIcons.circle,
                    text: 'Test',
                    iconActiveColor: Colors.deepPurpleAccent,
                    iconColor: Colors.black,
                    textColor: Colors.deepPurpleAccent,
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(.2),
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    iconActiveColor: Colors.red,
                    iconColor: Colors.black,
                    textColor: Colors.red,
                    backgroundColor: Colors.red.withOpacity(.2),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
