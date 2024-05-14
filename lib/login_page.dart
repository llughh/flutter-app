import 'package:flutter/material.dart';
import 'package:prueba/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Cambio de color principal a verde
      appBar: AppBar(
        title: Text('Inicio de sesión'), // Cambio de título de la barra de la aplicación
        backgroundColor: Colors.green[900], // Cambio de color de fondo de la barra de la aplicación
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DDirecta', // Texto introductorio
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página Home al presionar el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Iniciar sesión con Cl@ve'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para registrarse por datos personales
                },
                child: Text('Registrarse por datos personales'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
