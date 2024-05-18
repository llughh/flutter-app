import 'package:flutter/material.dart';

class Ley7 extends StatefulWidget {
  @override
  _Ley7State createState() => _Ley7State();
}

class _Ley7State extends State<Ley7> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 0; // Contador de votos

  void vote() {
    if (!hasVoted) {
      setState(() {
        hasVoted = true;
        voteCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ley de Transparencia y Acceso a la Información Pública'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estadísticas de la Ley 7',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Votos: $voteCount', // Muestra el contador de votos
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            // Botón para votar
            ElevatedButton(
              onPressed: hasVoted ? null : vote, // Deshabilita el botón si ya ha votado
              child: Text(hasVoted ? 'Ya has votado' : 'Votar'),
            ),
          ],
        ),
      ),
    );
  }
}
