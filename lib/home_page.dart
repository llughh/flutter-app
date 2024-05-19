import 'package:flutter/material.dart';
import 'package:prueba/ley1.dart' as Ley1; // Importa tu Ley1 aquí
import 'package:prueba/ley2.dart' as Ley2; // Importa tu Ley2 aquí
import 'package:prueba/ley3.dart' as Ley3; // Importa tu Ley3 aquí
import 'package:prueba/ley4.dart' as Ley4; // Importa tu Ley3 aquí
import 'package:prueba/ley5.dart' as Ley5; // Importa tu Ley3 aquí
import 'package:prueba/ley6.dart' as Ley6; // Importa tu Ley3 aquí
import 'package:prueba/ley7.dart' as Ley7; // Importa tu Ley3 aquí
import 'package:prueba/create_law.dart';

import 'package:prueba/infoLegal.dart' as InformacionLegalPage;
import 'package:share_plus/share_plus.dart';
import 'package:prueba/login_page.dart'; // Asegúrate de importar tu LoginPage aquí
import 'package:shared_preferences/shared_preferences.dart'; // Para gestionar el estado de sesión si es necesario

class HomePage extends StatefulWidget {
  final String? token; // Agregar este campo

  HomePage({this.token});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> laws = [
    {
      'title': 'Ley de Protección Ambiental',
      'description':
          'Ley para la protección y conservación de los recursos naturales y la biodiversidad.'
    },
    {
      'title': 'Ley de Igualdad de Género',
      'description':
          'Ley que promueve la igualdad de género en todos los ámbitos de la sociedad y prohíbe la discriminación por razón de sexo.'
    },
    {
      'title': 'Ley de Seguridad Cibernética',
      'description':
          'Ley que establece medidas para proteger la infraestructura digital y los datos personales contra ataques cibernéticos.'
    },
    {
      'title': 'Ley de Reforma Educativa',
      'description':
          'Ley para la mejora del sistema educativo, enfocada en la actualización de los planes de estudio y la capacitación docente.'
    },
    {
      'title': 'Ley de Energías Renovables',
      'description':
          'Ley que fomenta el desarrollo y uso de energías renovables para reducir la dependencia de combustibles fósiles y disminuir la huella de carbono.'
    },
    {
      'title': 'Ley de Protección de Datos Personales',
      'description':
          'Ley que regula el tratamiento y protección de los datos personales para garantizar la privacidad de los ciudadanos.'
    },
    {
      'title': 'Ley de Transparencia y Acceso a la Información Pública',
      'description':
          'Ley que garantiza el derecho de los ciudadanos a acceder a la información pública y promueve la transparencia gubernamental.'
    },
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredLaws = [];

  // Mapa que relaciona los títulos de las leyes con sus respectivas pantallas
  final Map<String, Widget> lawPages = {
    'Ley de Protección Ambiental': Ley1.Ley1(),
    'Ley de Igualdad de Género': Ley2.Ley2(),
    'Ley de Seguridad Cibernética': Ley3.Ley3(),
    'Ley de Reforma Educativa': Ley4.Ley4(),
    'Ley de Energías Renovables': Ley5.Ley5(),
    'Ley de Protección de Datos Personales': Ley6.Ley6(),
    'Ley de Transparencia y Acceso a la Información Pública': Ley7.Ley7(),
  };

  @override
  void initState() {
    super.initState();
    filteredLaws = laws;
    searchController.addListener(_filterLaws);
  }

  void _filterLaws() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredLaws = laws.where((law) {
        final title = law['title']!.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('NAVEGADOR'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 90, 180, 146),
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                _logout(context); // Llama a la función de logout
              },
            ),
            ListTile(
              title: Text('Solicitudes Votadas'),
              onTap: () {
                // Aquí puedes agregar la lógica para manejar la selección del ítem
              },
            ),
            ListTile(
              title: Text('Información Legal'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InformacionLegalPage.InformacionLegalPage()),
                );
              },
            ),
            ListTile(
              title: Text('Proponer Ley'),
              onTap: () {
                // Aquí puedes agregar la lógica para manejar la selección del ítem
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              // Aquí puedes agregar tu buscador
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Aquí puedes agregar tus cajas de texto
              Expanded(
                child: ListView.builder(
                  itemCount: filteredLaws.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredLaws[index]['title']!,
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            filteredLaws[index]['description']!,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Navegar a la página correspondiente según el título
                                  String title = filteredLaws[index]['title']!;
                                  if (lawPages.containsKey(title)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => lawPages[title]!,
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LeyDetailPage(
                                          title: filteredLaws[index]['title']!,
                                          description: filteredLaws[index]
                                              ['description']!,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Ver más'),
                              ),
                              IconButton(
                                icon: Icon(Icons.share),
                                onPressed: () {
                                  Share.share(
                                      'Consulta más sobre ${filteredLaws[index]['title']} en nuestra app!');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateLawPage()),
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) async {
    // Aquí puedes agregar la lógica para limpiar el estado del usuario, como borrar tokens, etc.
    // Ejemplo: Limpieza de preferencias compartidas (shared preferences)
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navega a la pantalla de login y reemplaza la actual
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

class LeyDetailPage extends StatelessWidget {
  final String title;
  final String description;

  LeyDetailPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
