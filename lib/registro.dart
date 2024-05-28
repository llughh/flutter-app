import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _successMessage;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // Inicializa Firebase
  }

  Future<void> _registerUser() async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'dni': _dniController.text,
        'nickname': _nicknameController.text,
        'password': _passwordController.text,
      });
      setState(() {
        _successMessage = 'Registro exitoso!';
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error en el registro: $e';
        _successMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Datos Personales'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ingrese sus datos personales',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _dniController,
                decoration: InputDecoration(labelText: 'DNI'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su DNI';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'El DNI debe contener solo números';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _nicknameController,
                decoration: InputDecoration(labelText: 'Nickname'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nickname';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
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
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _registerUser();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Registrar'),
                ),
              ),
              if (_successMessage != null) ...[
                SizedBox(height: 20.0),
                Text(
                  _successMessage!,
                  style: TextStyle(color: Colors.green),
                ),
              ],
              if (_errorMessage != null) ...[
                SizedBox(height: 20.0),
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
