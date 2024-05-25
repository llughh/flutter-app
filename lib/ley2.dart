import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley2 extends StatefulWidget {
  @override
  _Ley2State createState() => _Ley2State();
}

class _Ley2State extends State<Ley2> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 50000; // Contador de votos inicial

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
      new ImpactData('2021', 65),
      new ImpactData('2022', 80),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto de Igualdad de Género',
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
        title: Text('Ley de Igualdad de Género'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Igualdad de Género',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Igualdad de Género es una legislación crucial que busca asegurar la igualdad de oportunidades y derechos entre hombres y mujeres en todos los aspectos de la sociedad. Esta ley promueve la eliminación de la discriminación de género y apoya la equidad en el ámbito laboral, educativo y social.',
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
