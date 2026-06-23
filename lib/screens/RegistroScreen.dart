import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        width: 300,
        child: formulario(context)),),
    );
  }
}

Widget formulario(context){
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();
  TextEditingController edad = TextEditingController();


  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    TextField(controller: correo,),
    TextField(controller: contrasenia,),
    TextField(controller: nick,),
    TextField(controller: edad,),

    FilledButton.icon(onPressed: () => registro(correo, contrasenia, context), label: Text("Registro"), icon: Icon(Icons.app_registration_rounded),)

  ],);
}

Future<void> registro( correo, contrasenia, context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: correo.text,
    password: contrasenia.text,
  );
  Navigator.pushNamed(context, "/guardar");
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');

  showDialog(context: context, builder: (context) =>
  AlertDialog(title: Text("ERROR"),
  content: Text("El correo ya esta en uso"),
  
  ));

  }
} catch (e) {
  print(e);
}
}