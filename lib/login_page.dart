import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prueba/home_page.dart';
import 'package:prueba/registro.dart' as RegistroPage; // Asegúrate de importar tu nueva página
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // Inicializa Firebase
  }

  Future<void> _login() async {
    try {
      // Buscar en Firestore si el usuario y contraseña coinciden
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('nickname', isEqualTo: _userController.text)
          .where('password', isEqualTo: _passwordController.text)
          .get();
      
      if (result.docs.isNotEmpty) {
        // Si existe el usuario, navega a HomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Si no existe, muestra mensaje de error
        setState(() {
          _errorMessage = 'Usuario o contraseña incorrectos';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error de autenticación: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 135, 202, 140),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/top_image.png',
                    height: 200.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'DDirecta',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Tu voz, tu voto, tu Democracia Directa.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _userController,
                    decoration: InputDecoration(labelText: 'Usuario'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su usuario';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  if (_errorMessage != null) ...[
                    SizedBox(height: 10.0),
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistroPage.RegistroPage()), // Navega a la página de registro
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        'Registra Datos Personales',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
