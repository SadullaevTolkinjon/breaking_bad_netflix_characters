import 'package:breakingbad/pages/glavni.dart';
import 'package:breakingbad/pages/saved_page.dart';
import 'package:breakingbad/size_config/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _pages = [GlavniPAge(), SavedPage()];
  int _currnetIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0XFF09090F),
      body: _pages[_currnetIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currnetIndex,
          onTap: (val) {
            setState(() {
              _currnetIndex = val;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved")
          ]),
    );
  }
}
