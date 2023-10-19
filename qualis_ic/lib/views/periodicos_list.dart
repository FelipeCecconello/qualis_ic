import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/periodicoController.dart';
import 'package:qualis_ic/models/periodico.dart';
import 'package:qualis_ic/service/atualizaJson.dart';
import 'package:qualis_ic/main.dart';

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
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Periódicos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await atualizarJSONs(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                    (route) => false,
              );
            },
            child: Text('Atualizar'),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Periodico>>(
        valueListenable: controller.periodicos,
        builder: (context, periodicosList, child) {
          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Text('ISSN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text('Nome', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10), // Espaço adicional entre a segunda e a terceira coluna
                  SizedBox(
                    width: 50,
                    child: Text('Extrato CAPES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: periodicosList.length,
                  itemBuilder: (context, index) {
                    final periodico = periodicosList[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(periodico.issn ?? 'Sem ISSN', style: TextStyle(fontSize: 8)),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(periodico.nome ?? 'Sem nome', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: Text(periodico.extratoCAPES ?? 'Sem extrato CAPES', style: TextStyle(fontSize: 8)),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
