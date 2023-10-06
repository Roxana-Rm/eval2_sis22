
import 'package:flutter/material.dart';

import 'form_container_widget.dart';

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
      // appBar: AppBar(
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(Icons.menu),
      //        onPressed: () => print('has presionado el icono menu'),
      //        );
      //     },
      //   ),
      //   // title: const Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
          const SizedBox(height: 30,),
          FormContainerWidget (
            controller : _emailController,
            hintText: 'Emaiil',
            isPassWordFaild: false,
          ),
          const SizedBox(height: 30,),
          FormContainerWidget (
            controller : _passwordController,
            hintText: 'contraseña',
            isPassWordFaild: true,
          ),
            SizedBox(height: 1,),
            // MaterialButton(
            //   color: Colors.blue,
            //   onPressed: () {
            //     // Aquí va el código para verificar el correo y la contraseña.
            //   },
            //   child: const Text('Iniciar sesión'),
            // ),
            // GestureDetector(
            //   onTap: _isSingin,
            //   child: Container(
            //     width: double.infinity,
            //     height: 45,
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("no tienes una cuenta"),
              const SizedBox(width: 5,),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, MaterialPageRoute(builder: (context) => const singUpPage()), (Route) => false);
                },
                child: const Text('registrarme', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ],
            )
          ],
        ),
      ),
    );
  }
  void _isSingin() async {

    String Email = _emailController.text;
    String password = _passwordController.text;

    if (user != null) {
      print("login complteos");
      
      Navigator.pushReplacementNamed(context, "/");
    } else {
      print("some error happend");
    }

  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Importa la página de inicio (home.dart)

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     try {
//       final String email = _emailController.text.trim();
//       final String password = _passwordController.text.trim();

//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (userCredential.user != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()), // Redirige a HomePage
//         );
//       }
//     } catch (e) {
//       print('Error de inicio de sesión: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Login'),
//       //   backgroundColor: Colors.blue,
//       //   actions: [
//       //     IconButton(
//       //       icon: Icon(Icons.menu),
//       //       onPressed: () {
//       //         print('Has presionado el icono menú');
//       //       },
//       //     ),
//       //   ],
//       // ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   hintText: 'Correo electrónico',
//                   labelText: 'Correo electrónico',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce tu correo electrónico';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   hintText: 'Contraseña',
//                   labelText: 'Contraseña',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce tu contraseña';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 30.0),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text(
//                   'Login',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }
// }

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Prueba'),
// //       ),
// //       body: Center(
// //         child: Text('Prueba de enlaces'),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: LoginPage(),
// //   ));
// // }
