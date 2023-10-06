import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});



  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final bool _isSingin = false;

  // final FirebaseAuthService _auth = FirebaseAuthService{};
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
             onPressed: () => print('has presionado el icono menu'),
             );
          },
        ),
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
          //  TextFormField(
          //    decoration: const InputDecoration(
          //      labelText: 'Correo electrónico',
          //    ),
          //  ),
          //   TextFormField(
          //     decoration: InputDecoration(
          //       labelText: 'Contraseña',
          //       suffixIcon: IconButton(
          //         onPressed: () {
          //           setState(() {
          //           });
          //         },
          //         icon: Icon( Icons.visibility_off : Icons.visibility,
          //         ),
          //       ),
          //     ),
          //   ),
          const SizedBox(height: 30,),
          formContainerWidget (
            controller : _emailController,
            hintText: 'Email',
            isPassWordFaild: false
          ),
            SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // Aquí va el código para verificar el correo y la contraseña.
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}