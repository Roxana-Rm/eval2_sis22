import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import 'menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {


  void getChat() async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensaje = await collectionReference.get();
    if (mensaje.docs.length !=0) {
      for (var doc in mensaje.docs) {
        print(doc.data());
      }
    }
  }

void _alertSuccess (){
  QuickAlert.show(
    context: context,
    type: QuickAlertType. confirm 
    );
}
void _aleertClose (){
  QuickAlert.show(
 context: context,
 type: QuickAlertType.confirm,
 text: 'desea salir de esta  cosa',
 confirmBtnText: 'aceptar',
 cancelBtnText: 'cancelar',
 barrierDismissible: true,
 cancelBtnTextStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
 confirmBtnColor: Colors.green,
 onConfirmBtnTap: () {
  FirebaseAuth.instance.signOut();
  Navigator.pushNamed(context, "/Login");
 },
 onCancelBtnTap: (){
  Navigator.of(context).pop();
 },
);
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext){
            return IconButton(
              icon: const Icon(Icons.person_2),
              onPressed: () {
                _alertSuccess();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/add");
              
            },
            icon: const Icon(Icons.close),
            )
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("testing connection"),
          ],
        ),
      ), // Agrega el menú Drawer a esta página
                  drawer: MyDrawer(),
    );
  }
  @override
  void initState() {
    //metodo que se ejecuta automaticamente 
    super.initState();
    getChat();
  }

  @override
  void dispose() {
    //metodo que se ejecuta cuando se cierra
    super.dispose();
  }
}
