import 'package:flutter/material.dart';
import 'package:prueba/home_page.dart';
import 'package:prueba/success_screen.dart';

class CreateLawPage extends StatefulWidget {
  @override
  _CreateLawPageState createState() => _CreateLawPageState();
}

class _CreateLawPageState extends State<CreateLawPage> {
  final _formKey = GlobalKey<FormState>(); // Create a global key for the form

  // Define controllers for each form field
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _localityController = TextEditingController();
  final _addressController = TextEditingController();
  final _requestController = TextEditingController();

  bool _termsAccepted = false;
  bool _anonymousRequest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propuestas de Ley'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the global key to the form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                Center(
                  child: Text(
                    'Propuestas de Ley',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'Un paso más hacia una democracia más justa',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),

                // Name and Surname fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'Nombre'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'Apellidos'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese sus apellidos';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // ID and Email fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _idController,
                        decoration:
                            InputDecoration(labelText: 'NIF/NIE/Pasaporte'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su NIF/NIE/Pasaporte';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration:
                            InputDecoration(labelText: 'Correo Electrónico'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su correo electrónico';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Locality and Address fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _localityController,
                        decoration: InputDecoration(labelText: 'Localidad'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su localidad';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(labelText: 'Dirección'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su dirección';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Request field
                Text(
                  'Solicitud',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _requestController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su solicitud';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Checkboxes
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text('Acepto las condiciones de uso'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _anonymousRequest,
                      onChanged: (value) {
                        setState(() {
                          _anonymousRequest = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Quiero que la solicitud sea anónima frente a los usuarios de Directa',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Submit and Cancel Buttons
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form validation is successful, proceed to submit the law
                      // Here you can implement your logic to save the law data
                      print('Solicitud creada: ${_firstNameController.text}');
                      print('Apellidos: ${_lastNameController.text}');
                      print('NIF/NIE/Pasaporte: ${_idController.text}');
                      print('Correo Electrónico: ${_emailController.text}');
                      print('Localidad: ${_localityController.text}');
                      print('Dirección: ${_addressController.text}');
                      print('Solicitud: ${_requestController.text}');

                      // Clear the form fields after submission
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _idController.clear();
                      _emailController.clear();
                      _localityController.clear();
                      _addressController.clear();
                      _requestController.clear();

                      // Navegar a la pantalla de éxito
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessScreen()),
                      );
                    }
                  },
                  child: Text('Enviar Solicitud'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize:
                        Size(double.infinity, 50), // Full width, 50dp height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    side: BorderSide(
                      color: Colors.green,
                      width: 2.0, // Border width
                    ),
                  ),
                ),
                SizedBox(height: 16), // Espacio vertical entre los botones
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Cancelar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize:
                        Size(double.infinity, 50), // Full width, 50dp height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    side: BorderSide(
                      color: Colors.red,
                      width: 2.0, // Border width
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
