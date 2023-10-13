import 'package:flutter/material.dart';
import '../user_auth/firebase_auth_services.dart';
import '../widget/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_up_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? mensaje;

  void notificacion() {
    setState(() {});
  }

  void _isSinging() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("Login completo");
      Navigator.pushReplacementNamed(context, "/add");
    } else {
      print("Some error happend");
      setState(() {
        mensaje = "Error al iniciar sesión.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            FormContainerWidget(
              controller: _emailController,
              hintText: 'Email',
              isPassWordFaild: false,
            ),
            const SizedBox(height: 30),
            FormContainerWidget(
              controller: _passwordController,
              hintText: 'Contraseña',
              isPassWordFaild: true,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _isSinging,
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("No tienes una cuenta?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                      (route) => false,
                    );
                  },
                  child: const Text("Registrarme", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              '$mensaje',
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
