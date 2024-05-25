import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley6 extends StatefulWidget {
  @override
  _Ley6State createState() => _Ley6State();
}

class _Ley6State extends State<Ley6> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 4800; // Contador de votos

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
      new ImpactData('2018', 20),
      new ImpactData('2019', 35),
      new ImpactData('2020', 50),
      new ImpactData('2021', 70),
      new ImpactData('2022', 90),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto de Protección de Datos Personales',
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
        title: Text('Ley de Protección de Datos Personales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Protección de Datos Personales',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Protección de Datos Personales es una legislación esencial que busca garantizar la privacidad y seguridad de la información personal. Esta ley establece normativas para la recolección, procesamiento y almacenamiento de datos personales, protegiendo los derechos de los individuos frente a posibles abusos y violaciones de privacidad.',
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
