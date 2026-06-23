import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Leerscreen extends StatelessWidget {
  const Leerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lista(),
    );
  }
}

Future<List<dynamic>> leerFire() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('autos/').get();
  if (snapshot.exists) {
    //print(snapshot.value);
    return snapshot.children.map((child) {
      final data = Map.from(child.value as Map);
      return {
        "placa": child.key,
        "marca": data['marca'],
        "precio": data['precio'],
      };
    }).toList();
  } else {
    return [];
  }
}

Widget lista() {
  return FutureBuilder(
    future: leerFire(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return ListTile(
              onTap: () => verDetalles(context, item),
              title: Text(item['placa'])
            );
          },
        );
      } else {
        return Text("No existe la lista");
      }
    },
  );
}

//funcion para ver detalle de la lista
void verDetalles(BuildContext context, Map<String, dynamic> item) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item['placa']),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Región: ${item['marca']}"),
            Text("Precio: \$${item['precio']}"),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cerrar"),
        ),
      ],
    ),
  );
}
