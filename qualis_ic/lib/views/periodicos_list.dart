import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/periodicoController.dart';
import 'package:qualis_ic/models/periodico.dart';

class PeriodicosPage extends StatefulWidget {
  const PeriodicosPage({Key? key}) : super(key: key);

  @override
  _PeriodicosPageState createState() => _PeriodicosPageState();
}

class _PeriodicosPageState extends State<PeriodicosPage> {
  final controller = PeriodicosController();

  @override
  void initState() {
    controller.fetchPeriodicos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: const Text(
          'Periódicos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Periodico>>(
        valueListenable: controller.getPeriodicos(),
        builder: (context, periodicosList, child) {
          if (periodicosList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: periodicosList.length,
              itemBuilder: (context, index) {
                final periodico = periodicosList[index];
                return ListTile(
                  title: Text(periodico.nome ?? 'Sem título'),
                  subtitle: Text('ISSN: ${periodico.issn}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
