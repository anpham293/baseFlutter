import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/function/NavigatorFunc/NavigatorFunc.dart';

class BasicBottomNavigationBar extends StatefulWidget {
  const BasicBottomNavigationBar({super.key});

  @override
  State<BasicBottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BasicBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Back',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Share',
      style: optionStyle,
    ),
    Text(
      'Index 2: Like',
      style: optionStyle,
    ),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch(index){
      case 0: back(context);
      case 1: returnHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        if(Navigator.canPop(context)) BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: 'Trở lại',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'Share',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_sharp),
          label: 'Like',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey.shade700,
      onTap: _onItemTapped,
    );
  }
}