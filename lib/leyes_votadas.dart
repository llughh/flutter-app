import 'package:flutter/material.dart';

class LeyesVotadas extends StatelessWidget {
  final List<String> leyVotadas;

  LeyesVotadas({required this.leyVotadas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leyes Votadas'),
      ),
      body: ListView.builder(
        itemCount: leyVotadas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(leyVotadas[index]),
          );
        },
      ),
    );
  }
}
