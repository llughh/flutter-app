import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley4 extends StatefulWidget {
  @override
  _Ley4State createState() => _Ley4State();
}

class _Ley4State extends State<Ley4> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 190000; // Contador de votos

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
    var data = [
      new ImpactData('2018', 15),
      new ImpactData('2019', 30),
      new ImpactData('2020', 50),
      new ImpactData('2021', 65),
      new ImpactData('2022', 85),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto de Reforma Educativa',
        domainFn: (ImpactData impact, _) => impact.year,
        measureFn: (ImpactData impact, _) => impact.impact,
        data: data,
        labelAccessorFn: (ImpactData impact, _) =>
            '${impact.year}: ${impact.impact.toString()}%',
      )
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Ley de Reforma Educativa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Reforma Educativa',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Reforma Educativa es una legislación clave que busca mejorar la calidad de la educación mediante reformas curriculares, mejoramiento de infraestructura, y capacitación de maestros. Esta ley tiene como objetivo proporcionar una educación equitativa y de calidad para todos los estudiantes.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 200.0,
              padding: EdgeInsets.all(16.0),
              child: chart,
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

class ImpactData {
  final String year;
  final int impact;

  ImpactData(this.year, this.impact);
}
