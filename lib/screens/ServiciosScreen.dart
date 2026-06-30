import 'dart:convert';
import 'package:app_12/navigations/NavegadorDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Servicios Médicos', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder(
        future: leer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  color: Colors.grey[900],
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => verDetalles(context, item),
                    leading: Image.network(
                      item['info']['imagen'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error, color: Colors.white),
                    ),
                    title: Text(
                      item['nombre'],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Horario: ${item['horario']}',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: const NavegadorDrawer(),
    );
  }

  //leer json externo
  Future<List> leer() async {
    final respuesta = await http.get(
      Uri.parse("https://jritsqmet.github.io/web-api/medico.json"),
    );
    return json.decode(respuesta.body)['servicio_medico'];
  }

  //funcion para ver detalle del servicio
  void verDetalles(context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          item['nombre'],
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Descripción: ${item['descripcion']}',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                'Teléfono: ${item['contacto']['telefono']}',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'Email: ${item['contacto']['email']}',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
