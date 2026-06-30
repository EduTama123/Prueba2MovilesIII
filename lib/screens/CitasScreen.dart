import 'package:app_12/navigations/NavegadorDrawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CitasScreen extends StatelessWidget {
  const CitasScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cita Médica'),
      ),
      body: formularioCitas(context),
      drawer: const NavegadorDrawer(),
    );
  }
}

Widget formularioCitas(context) {
  TextEditingController id = TextEditingController();
  TextEditingController especialidad = TextEditingController();
  TextEditingController dia = TextEditingController();

  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: id,
          decoration: InputDecoration(
            labelText: 'ID de la Cita',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: especialidad,
          decoration: InputDecoration(
            labelText: 'Especialidad',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: dia,
          decoration: InputDecoration(
            labelText: 'Día (ej: 2024-12-25)',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => guardarCita(context, id, especialidad, dia),
          label: Text('Guardar Cita'),
          icon: Icon(Icons.save),
        ),
      ],
    ),
  );
}

Future<void> guardarCita(context, id, especialidad, dia) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("citas/${id.text}");

  await ref.set({
    "id": id.text,
    "especialidad": especialidad.text,
    "dia": dia.text,
  });
}
