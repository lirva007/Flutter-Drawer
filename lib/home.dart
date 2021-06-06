import 'package:clase4drawer/pages/gallery.dart';
import 'package:flutter/material.dart';
import './pages/gallery.dart';
import './pages/import.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectDrawerItem = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Import();
      case 1:
        return Gallery();
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('< Magda />', style: TextStyle(fontSize: 25.0)),
      ), // AppBar
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:
                  Text('Magdalena Flores', style: TextStyle(fontSize: 20.0)),
              accountEmail:
                  Text('lirva.a.g@gmail.com', style: TextStyle(fontSize: 15.0)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('D', style: TextStyle(fontSize: 40.0)),
              ), // CircleAvatar
            ), // UserAccountsDrawerHeader
            ListTile(
              title: Text('Import'),
              leading: Icon(Icons.camera_alt),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ), // ListTitle
            ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.photo_library),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ), // ListTitle
          ], // <Widget>[]
        ), // ListView
      ), // Drawer
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
