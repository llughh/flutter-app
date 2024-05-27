import 'package:flutter/material.dart';
import 'package:prueba/login_page.dart'; // Asegúrate de tener importado el archivo login_page.dart aquí
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Espera 2 segundos y luego navega a la pantalla de inicio de sesión
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Ancho de la pantalla
        height: MediaQuery.of(context).size.height, // Alto de la pantalla
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/front-page.png'), // Ruta de la imagen
            fit: BoxFit
                .cover, // Ajustar la imagen para que cubra todo el contenedor
          ),
        ),
      ),
    );
  }
}
