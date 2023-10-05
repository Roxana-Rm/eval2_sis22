import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProductos() async {
  List productos = [];
  CollectionReference collectionReference = db.collection('tb_productos');
  QuerySnapshot querySnapshot = await collectionReference.get();

  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final estudiante = {
      "uid": doc.id,
      "nombre": data["nombre"],
      "precio": data["precio"],
      "stock": data["stock"],
    };

    productos.add(estudiante);
  }

  //await Future.delayed(const Duration(seconds: 2));
  return productos;
}

Future<List> getStudiantes1() async {
  List productos = [];
  CollectionReference collectionReference = db.collection('tb_productos');
  QuerySnapshot querySnapshot = await collectionReference.get();

  /* for (var documento in querySnapshot.docs) { productos.add(documento.data()); } */

  querySnapshot.docs.forEach((documento) {
    productos.add(documento.data());
  });

  //print('$productos');

  await Future.delayed(const Duration(seconds: 2));
  return productos;
}

Future<void> addAlumno(String nombre, String precio, String stock) async {
  await db
      .collection('tb_productos')
      .add({"nombre": nombre, "precio": precio, "stock": stock});
}

Future<void> editAlumno(
    String uid, String nombre, String precio, String stock) async {
  await db
      .collection('tb_productos')
      .doc(uid)
      .set({"nombre": nombre, "precio": precio, "stock": stock});
}

Future<void> deleteAlumno(String uid) async {
  await db.collection('tb_productos').doc(uid).delete();
}

Future<List<DocumentSnapshot>> getAllObjects() async {
  try {
    // Accede a la colección deseada en Firestore (cambia 'coleccion' al nombre de tu colección).
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('coleccion').get();

    // Extrae y devuelve todos los documentos de la colección.
    return querySnapshot.docs;
  } catch (e) {
    // Manejo de errores, por ejemplo, si no se puede acceder a la base de datos.
    print('Error al obtener los objetos: $e');
    return [];
  }
}
