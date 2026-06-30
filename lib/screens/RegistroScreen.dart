import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Registro de Usuario',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: formularioRegistro(context),
        ),
      ),
    );
  }
}

Widget formularioRegistro(context) {
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
        onPressed: () => registro(context, correo, contrasenia),
        label: const Text('Registrarse'),
        icon: const Icon(Icons.app_registration),
      ),
    ],
  );
}

Future<void> registro(correo, contrasenia, context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo.text,
      password: contrasenia.text,
    );
    Navigator.pushNamed(context, "/guardar");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("ERROR"),
                content: Text("El correo ya esta en uso"),
              ));
    }
  } catch (e) {
    print(e);
  }
}
