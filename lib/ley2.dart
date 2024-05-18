import 'package:flutter/material.dart';

class Ley2 extends StatefulWidget {
  @override
  _Ley2State createState() => _Ley2State();
}

class _Ley2State extends State<Ley2> {
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
        title: Text('Ley de Igualdad de Género'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estadísticas de la Ley 2',
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
