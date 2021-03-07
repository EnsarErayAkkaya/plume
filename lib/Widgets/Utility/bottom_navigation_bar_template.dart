import 'package:flutter/material.dart';
import 'package:plume/Data/navbar_item.dart';

class BottomNavigationBarTemplate extends StatefulWidget {
  final String home;
  final String connections;
  final String profile;
  final Function press;
  final Color primaryColor;
  final Color accentColor;
  const BottomNavigationBarTemplate({Key key, this.press, this.primaryColor, this.accentColor, this.home, this.connections, this.profile}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<BottomNavigationBarTemplate> {
  int _selectedIndex = 0;
  List<NavbarItem> _navbarItems = [
    NavbarItem(icon: Icons.home,text: 'home'),
    NavbarItem(icon: Icons.person_search,text: 'connections'),
    NavbarItem(icon: Icons.person,text: 'profile'),
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
        label: s.text == 'home'?widget.home:
          s.text == 'connections'?widget.connections:
          s.text == 'profile'?widget.profile:'NotDefined',
      ),
    ).toList(),
    currentIndex: _selectedIndex,
    onTap: (index) => onItemTapped(index),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
    );
  }


}
