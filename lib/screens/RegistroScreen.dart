import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build( context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Registro de Usuario', style: TextStyle(color: Colors.white)),
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

Widget formularioRegistro( context) {
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
        onPressed: () => registro(context, correo, contrasenia),
        label: Text('Registrarse'),
        icon: Icon(Icons.app_registration),
      ),
    ],
  );
}

Future<void> registro( context, correo, contrasenia) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo.text,
      password: contrasenia.text,
    );
    Navigator.pushReplacementNamed(context, "/login");
  } on FirebaseAuthException catch (e) {
    String mensaje = '';
    if (e.code == 'weak-password') {
      mensaje = 'La contraseña es muy débil (mínimo 6 caracteres)';
    } else if (e.code == 'email-already-in-use') {
      mensaje = 'Este correo ya está registrado';
    } else {
      mensaje = 'Error al registrarse: ${e.message}';
    }
    mostrarAlerta(context, 'Error de Registro', mensaje);
  } catch (e) {
    mostrarAlerta(context, 'Error', 'Ocurrió un error inesperado');
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