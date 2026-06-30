import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build( context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
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

Widget formularioLogin( context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: correo,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Correo Electrónico',
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
     SizedBox(height: 10),
      TextField(
        controller: contrasenia,
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Contraseña',
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(),
        ),
      ),
     SizedBox(height: 20),
      FilledButton.icon(
        onPressed: () => login(context, correo, contrasenia),
        label: Text('Iniciar Sesión'),
        icon: Icon(Icons.login),
      ),
    ],
  );
}

Future<void> login( context,  correo,  contrasenia) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: correo.text,
      password: contrasenia.text,
    );
    Navigator.pushReplacementNamed(context, "/servicios");
  } catch (e) {
    mostrarAlerta(context, 'Error de Autenticación', 'Usuario o contraseña incorrecto');
  }
}

void mostrarAlerta( context, titulo, mensaje) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(mensaje),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Aceptar'),
        ),
      ],
    ),
  );
}