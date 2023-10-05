import 'package:flutter/material.dart';
import 'crud.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({Key? key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final TextEditingController _nombreControllers =
      TextEditingController(text: "");
  final TextEditingController _precioControllers =
      TextEditingController(text: "");
  final TextEditingController _stockControllers =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // Agrega un SingleChildScrollView aquí
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'Agregar Producto',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nombreControllers,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'nombre del producto',
                  prefixIcon: Icon(Icons.shopping_cart, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _precioControllers,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite su precio',
                  prefixIcon: Icon(
                    Icons.monetization_on,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _stockControllers,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite la cantidad de productos',
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await addAlumno(_nombreControllers.text,
                          _precioControllers.text, _stockControllers.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
