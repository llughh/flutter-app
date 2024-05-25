import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Ley5 extends StatefulWidget {
  @override
  _Ley5State createState() => _Ley5State();
}

class _Ley5State extends State<Ley5> {
  bool hasVoted = false; // Estado para rastrear si el usuario ha votado
  int voteCount = 430222; // Contador de votos

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
      new ImpactData('2018', 10),
      new ImpactData('2019', 20),
      new ImpactData('2020', 35),
      new ImpactData('2021', 50),
      new ImpactData('2022', 75),
    ];

    var series = [
      new charts.Series<ImpactData, String>(
        id: 'Impacto de Energías Renovables',
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
        title: Text('Ley de Energías Renovables'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ley de Energías Renovables',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'La Ley de Energías Renovables es una legislación importante que busca promover el uso de fuentes de energía limpia y sostenible. Esta ley incentiva la inversión en tecnologías renovables como la solar, eólica y geotérmica, y establece metas para reducir las emisiones de carbono y combatir el cambio climático.',
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
