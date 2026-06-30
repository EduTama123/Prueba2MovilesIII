import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sistema de Citas Médicas',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Tu salud es nuestra prioridad',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 50),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, "/login"),
              style: FilledButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, "/registro"),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text(
                'Registrarse',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Desarrollador: Eduardo Tamayo\nGitHub: EduTama123',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
