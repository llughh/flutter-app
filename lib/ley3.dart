import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley3 extends StatefulWidget {
  @override
  _Ley3State createState() => _Ley3State();
}

class _Ley3State extends State<Ley3> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 80000; // Contador de votos

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
      new ImpactData('2018', 25),
      new ImpactData('2019', 40),
      new ImpactData('2020', 55),
      new ImpactData('2021', 70),
      new ImpactData('2022', 90),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto de Seguridad Cibernética',
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
        title: Text('Ley de Seguridad Cibernética'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Seguridad Cibernética',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Seguridad Cibernética es una legislación esencial que busca proteger los sistemas informáticos, redes y datos contra ataques cibernéticos. Esta ley establece medidas para prevenir el acceso no autorizado, el robo de información y otras amenazas cibernéticas, garantizando la seguridad y la privacidad de los usuarios.',
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
