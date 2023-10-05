import 'package:eval2_sis22/pages/agregar.dart';
import 'package:eval2_sis22/pages/consultas.dart';
import 'package:eval2_sis22/pages/info.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _item = 0;

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        // ignore: prefer_const_constructors
        return AddStudents();
      case 1:
        return MyScreen();
      case 2:
        return MyAp();
      case 3:
        return ();
      case 4:
        return ();
    }
  }

  void _SetItemDrawer(int position) {
    Navigator.pop(context);
    setState(() {
      _item = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluacion 2 - CRUD'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Text(
                'EDWARD LEMUS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              selected: (0 == _item),
              leading: Icon(Icons.content_paste),
              title: Text('Agregar Producto:'),
              onTap: () {
                _SetItemDrawer(0);
              },
            ),
            // Divider(
            //   color: Colors.black,
            // ),
            ListTile(
              selected: (1 == _item),
              leading: Icon(Icons.find_in_page),
              title: Text('Buscar Pruducto:'),
              onTap: () {
                _SetItemDrawer(1);
              },
            ),
            ListTile(
              selected: (2 == _item),
              leading: Icon(Icons.person),
              title: Text('Acerca de:'),
              onTap: () {
                _SetItemDrawer(2);
              },
            ),
            // ListTile(
            //   selected: (2 == _item),
            //   leading: Icon(Icons.arrow_forward_ios),
            //   title: Text('Page 2'),
            //   onTap: () {
            //     _SetItemDrawer(3);
            //   },
            // ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_item),
    );
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return AddStudents();
      case 1:
        return MyScreen();
      case 2:
        return MyAp();
      // Agrega más casos según las páginas que quieras mostrar.
      default:
        return Center(
          child: Text('Página no encontrada'),
        );
    }
  }
}
