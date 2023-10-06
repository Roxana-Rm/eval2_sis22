
import 'package:flutter/material.dart';
import 'form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            const SizedBox(height: 20,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("no tienes una cuenta"),
              const SizedBox(width: 5,),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const singUpPage()), (Route) => false);
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