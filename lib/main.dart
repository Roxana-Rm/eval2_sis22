import 'package:eval2_sis22/pages/agregar.dart';
import 'package:eval2_sis22/pages/consultas.dart';
import 'package:eval2_sis22/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((_) {
    runApp(MyApp());
  });
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 29, 12, 255)),
        useMaterial3: true,
      ),
      
      home: const MyHomePage(title: 'evalucaion 2'),
      initialRoute: "/login",
      routes: {
            "/add": (context) => const AddStudents(),
            "/signup": (context) => MyScreen(),
            "/login": (context) => Login(),
      },
      
    );
  }
}