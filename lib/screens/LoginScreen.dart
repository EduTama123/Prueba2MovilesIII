import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

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


  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    TextField(controller: correo,),
    TextField(controller: contrasenia,),
    FilledButton.icon(onPressed: () => login(context, correo, contrasenia), label: Text("Login"), icon: Icon(Icons.login),)

  ],);
}

Future<void> login(context, correo, contrasenia) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: correo.text,
    password: contrasenia.text
  );
  Navigator.pushNamed(context, "/guardar");

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}