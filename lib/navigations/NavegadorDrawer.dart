import 'package:flutter/material.dart';

class NavegadorDrawer extends StatelessWidget {
  const NavegadorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sistema de Citas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Médicas',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Crear Cita'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/citas");
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_services),
            title: const Text('Servicios'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/servicios");
            },
          ),
        ],
      ),
    );
  }
}