import 'package:flutter/material.dart';

class InformacionLegalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información Legal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Información Legal',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Protección de Datos Personales',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'En DDirecta, la protección de tus datos personales es de suma importancia. '
                  'Nos comprometemos a procesar tus datos personales de acuerdo con la normativa vigente, '
                  'incluyendo el Reglamento General de Protección de Datos (RGPD) y la Ley Orgánica de Protección '
                  'de Datos y Garantía de los Derechos Digitales (LOPDGDD).',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Finalidad del Tratamiento',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Los datos personales que recopilamos serán utilizados exclusivamente para la gestión de las '
                  'propuestas de leyes y la autenticación de los usuarios. Tu información se utilizará para '
                  'verificar tu identidad, gestionar tus propuestas y contar los votos necesarios para llevar las '
                  'propuestas al Congreso.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Recogida y Almacenamiento de Datos',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Recopilamos datos personales tales como nombre, apellidos, número de identificación y dirección de correo electrónico. '
                  'Estos datos se almacenan de manera segura y se protegen contra accesos no autorizados mediante el uso de medidas '
                  'de seguridad técnicas y organizativas adecuadas.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Derechos de los Usuarios',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Tienes derecho a acceder, rectificar y suprimir tus datos personales, así como a oponerte al tratamiento de los mismos '
                  'y a solicitar la limitación del tratamiento y la portabilidad de tus datos. Para ejercer estos derechos, puedes '
                  'ponerte en contacto con nuestro Delegado de Protección de Datos a través del correo electrónico proporcionado en la aplicación.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Transferencias de Datos',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Tus datos personales no serán transferidos a terceros sin tu consentimiento previo, excepto cuando sea necesario para el '
                  'cumplimiento de una obligación legal o en el marco de una relación contractual con proveedores de servicios que actúen '
                  'en nuestro nombre y bajo nuestras instrucciones.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Seguridad de los Datos',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Implementamos medidas de seguridad adecuadas para proteger tus datos personales contra pérdida, uso indebido, acceso no autorizado, '
                  'divulgación, alteración y destrucción. Revisamos regularmente nuestras políticas y procedimientos de seguridad para asegurarnos de '
                  'que sean eficaces y cumplan con los requisitos legales aplicables.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Consentimiento',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Al utilizar nuestra aplicación, aceptas la recopilación y el uso de tu información personal de acuerdo con esta política de privacidad. '
                  'Te informaremos sobre cualquier cambio significativo en nuestra política de privacidad a través de la aplicación o mediante otros medios adecuados.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Contacto',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Si tienes alguna pregunta o inquietud sobre nuestra política de privacidad o el tratamiento de tus datos personales, '
                  'no dudes en ponerte en contacto con nosotros a través del correo electrónico info@ddirecta.com.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
