import 'package:app_12/screens/DetallesScreen.dart';
import 'package:app_12/screens/GuardarScreen.dart';
import 'package:app_12/screens/LeerScreen.dart';
import 'package:app_12/screens/LoginScreen.dart';
import 'package:app_12/screens/RegistroScreen.dart';
import 'package:app_12/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: "/guardar",
      routes: {
        "/": (context) => Welcomescreen(),
        "/login": (context) => Loginscreen(),
        "/registro": (context) => Registroscreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => Leerscreen(),
        "/detalles": (context) => Detallesscreen()
      },
    );
  }
}
