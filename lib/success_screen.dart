import 'package:flutter/material.dart';
import 'package:prueba/home_page.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ley Creada con Éxito'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'LEY CREADA CON ÉXITO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '¡Gracias por tu solicitud para la creación de una nueva ley! Nos complace informarte que la ley propuesta ha sido creada exitosamente y ahora está en proceso de análisis. Nuestro equipo de abogados la revisará detenidamente una vez que alcance el número necesario de firmas.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Queremos asegurarte que estaremos en contacto contigo durante todo el proceso, manteniéndote informado sobre el progreso de la ley y cualquier actualización relevante. Tu apoyo es crucial para hacer realidad esta iniciativa y mejorar nuestra democracia.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Tu participación no solo es valorada, sino que también es fundamental para el cambio. Con el esfuerzo de personas como tú, podemos avanzar hacia una sociedad más justa y equitativa.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '¡Gracias nuevamente por tu solicitud y por contribuir a hacer una diferencia positiva en nuestra comunidad!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Navega a la página de registro
                );
              },
              child: Text('Volver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize:
                    Size(double.infinity, 50), // Full width, 50dp height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                side: BorderSide(
                  color: Colors.green,
                  width: 2.0, // Border width
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
