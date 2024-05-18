import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley1 extends StatefulWidget {
  @override
  _Ley1State createState() => _Ley1State();
}

class _Ley1State extends State<Ley1> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 100102; // Contador de votos inicial

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
      new ImpactData('2018', 30),
      new ImpactData('2019', 45),
      new ImpactData('2020', 60),
      new ImpactData('2021', 80),
      new ImpactData('2022', 100),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto Ambiental',
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
        title: Text('Ley de Protección Ambiental'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Protección Ambiental',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Protección Ambiental es una legislación vital que busca proteger y conservar los recursos naturales y la biodiversidad. Esta ley establece regulaciones y medidas para prevenir la degradación del medio ambiente y promover prácticas sostenibles en todas las actividades humanas.',
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
