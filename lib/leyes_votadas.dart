import 'package:flutter/material.dart';

class LeyesVotadas extends StatefulWidget {
  final List<Map<String, String>> leyVotadas;

  LeyesVotadas({required this.leyVotadas});

  @override
  _LeyesVotadasState createState() => _LeyesVotadasState();
}

class _LeyesVotadasState extends State<LeyesVotadas> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredLaws = [];

  @override
  void initState() {
    super.initState();
    filteredLaws = widget.leyVotadas;
    searchController.addListener(_filterLaws);
  }

  void _filterLaws() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredLaws = widget.leyVotadas.where((law) {
        final title = law['title']!.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leyes Votadas'),
      ),
      body: Column(
        children: <Widget>[
          // Aquí está el buscador
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Aquí está la lista de leyes filtradas
          Expanded(
            child: ListView.builder(
              itemCount: filteredLaws.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredLaws[index]['title']!,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        filteredLaws[index]['description']!,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
