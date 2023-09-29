import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('adicion'),
            onTap: () {
              // Lógica para manejar la selección de "Inicio"
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('consultas'),
            onTap: () {
              // Lógica para manejar la selección de "Inicio"
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text('acerca de de: '),
            onTap: () {
              // Lógica para manejar la selección de "Configuración"
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          // Agrega más opciones de menú aquí
        ],
      ),
    );
  }
}
