import 'package:flutter/material.dart';

void main() {
  runApp(MyAp());
}

class MyAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Desarrolladores :'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PersonaInfo(
                imageName:
                    'bea.jpeg', // Nombre de la imagen en la carpeta "images"
                name: 'ROXANA BEATRIZ MENDOZA VENTURA',
                email: 'roxana.escobar22@itca.edu.sv',
              ),
              PersonaInfo(
                imageName:
                    'yo.jpeg', // Nombre de la segunda imagen en la carpeta "images"
                name: 'EDWARD STIVEN LEMUS CRUZ.',
                email: 'edward.lemus22@itca.edu.sv',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonaInfo extends StatelessWidget {
  final String imageName;
  final String name;
  final String email;

  PersonaInfo(
      {required this.imageName, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'images/$imageName', // Ruta de la imagen en la carpeta "images"
          width: 120,
          height: 120,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          email,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
