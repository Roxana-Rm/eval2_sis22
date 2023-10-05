import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Actuales'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
          future: getAllObjects(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No se encontraron objetos en Firebase.');
            } else {
              // Construye una DataTable con los datos obtenidos.
              return Center(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Precio')),
                    DataColumn(label: Text('Stock')),
                  ],
                  rows: snapshot.data!.docs.map((document) {
                    var objectData = document.data() as Map<String, dynamic>;
                    return DataRow(
                      cells: [
                        DataCell(Text(objectData['nombre'])),
                        DataCell(Text(objectData['precio'].toString())),
                        DataCell(Text(objectData['stock'].toString())),
                      ],
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<QuerySnapshot> getAllObjects() async {
    try {
      // Accede a la colección deseada en Firestore (cambia 'tb_productos' al nombre de tu colección).
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tb_productos').get();

      // Devuelve el resultado de la consulta.
      return querySnapshot;
    } catch (e) {
      // Manejo de errores, por ejemplo, si no se puede acceder a la base de datos.
      print('Error al obtener los objetos: $e');
      throw e;
    }
  }
}
