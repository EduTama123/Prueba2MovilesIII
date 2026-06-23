import 'package:flutter/material.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(""),
          fit: BoxFit.cover)
        ),
        
        child: Center(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/login"),
             child: Text("Login")),
          FilledButton(onPressed: () => Navigator.pushNamed(context, "/registro"),
           child: Text("Registro")),
        ],),),
      ),
    );
  }
}