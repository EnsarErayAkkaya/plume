import 'package:flutter/material.dart';
import 'package:plume/Data/navbar_item.dart';

class BottomNavigationBarTemplate extends StatefulWidget {
  final Function press;
  final Color primaryColor;
  final Color accentColor;
  const BottomNavigationBarTemplate({Key key, this.press, this.primaryColor, this.accentColor}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationBarTemplate> {
  int _selectedIndex = 0;
  List<NavbarItem> _navbarItems = [
    NavbarItem(icon: Icons.home,text: 'Home'),
    NavbarItem(icon: Icons.person_search,text: 'Students'),
    NavbarItem(icon: Icons.person,text: 'Profile'),
  ];
  Color c;
  void onItemTapped(int index ) {
    setState(() {
      _selectedIndex = index;
      c = _selectedIndex % 2 == 0? widget.primaryColor : widget.accentColor;
    });
    widget.press(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    backgroundColor: c == null?widget.primaryColor:c,
    items: _navbarItems.map(
      (s) => BottomNavigationBarItem(
        icon: Icon(
          s.icon,
        ),
        label: s.text,
      ),
    ).toList(),
    currentIndex: _selectedIndex,
    onTap: (index) => onItemTapped(index),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
    );
  }


}
