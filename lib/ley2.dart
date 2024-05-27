import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

class Ley2 extends StatefulWidget {
  @override
  _Ley2State createState() => _Ley2State();
}

class _Ley2State extends State<Ley2> {
  bool hasVoted = false;
  int voteCount = 100102;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void vote() {
    if (!hasVoted) {
      setState(() {
        hasVoted = true;
        voteCount++;
      });
    }
  }

  void _sendMessage() async {
    final String messageText = _textController.text.trim();
    final String userName = _nameController.text.trim().isEmpty ? 'anónimo' : _nameController.text.trim();
    if (messageText.isNotEmpty) {
      await FirebaseFirestore.instance.collection('messages_ley2').add({
        'text': messageText,
        'user': userName,
        'createdAt': Timestamp.now(),
      });
      _textController.clear();
      _nameController.clear(); // Limpiar el campo de nombre después de enviar el mensaje
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      new ImpactData('2019', 30),
      new ImpactData('2020', 35),
      new ImpactData('2021', 60),
      new ImpactData('2022', 100),
      new ImpactData('2023', 120),
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
              'Votos: $voteCount',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: hasVoted ? null : vote,
              child: Text(hasVoted ? 'Ya has votado' : 'Votar'),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('messages_ley2')
                          .orderBy('createdAt')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data?.docs ?? [];
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final message = documents[index].data() as Map<String, dynamic>;
                            final user = message['user'] ?? 'anónimo';
                            final text = message['text'] ?? '';
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(text),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(hintText: 'Tu nombre (opcional)'),
                              ),
                              SizedBox(height: 8.0),
                              TextField(
                                controller: _textController,
                                decoration: InputDecoration(hintText: 'Escribe un mensaje...'),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _sendMessage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
