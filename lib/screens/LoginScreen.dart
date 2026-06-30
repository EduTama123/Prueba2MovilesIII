import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: formularioLogin(context),
        ),
      ),
    );
  }
}

Widget formularioLogin(context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: correo,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          labelText: 'Correo Electrónico',
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
      const SizedBox(height: 10),
      TextField(
        controller: contrasenia,
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => login(context, correo, contrasenia),
        label: const Text('Iniciar Sesión'),
        icon: const Icon(Icons.login),
      ),
    ],
  );
}

Future<void> login(context, correo, contrasenia) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo.text, password: contrasenia.text);
    Navigator.pushNamed(context, "/servicios");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
