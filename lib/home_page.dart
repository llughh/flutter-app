import 'package:flutter/material.dart';
import 'package:prueba/ley1.dart'; // Importa tu Ley1 aquí

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // Agregar icono de hamburguesa
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
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Aquí puedes agregar la lógica para manejar la selección del ítem
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
                // Aquí puedes agregar la lógica para manejar la selección del ítem
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Aquí puedes agregar tu buscador
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Aquí puedes agregar tus cajas de texto
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Texto de ejemplo 1',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Descripción de ejemplo 1',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Navegar a Ley1 cuando se presiona el botón
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ley1()),
                            );
                          },
                          child: Text('Ver más'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Texto de ejemplo 2',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Descripción de ejemplo 2',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para ver más
                          },
                          child: Text('Ver más'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                // Lógica para ir a otra página
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
