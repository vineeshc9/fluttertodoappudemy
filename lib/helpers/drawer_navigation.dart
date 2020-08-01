import 'package:flutter/material.dart';
import 'package:todoapp/screens/categories_screen.dart';
import 'package:todoapp/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Vin'),
              accountEmail: Text('vin@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.category),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoriesScreen()));
              },
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
