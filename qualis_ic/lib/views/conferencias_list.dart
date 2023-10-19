import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/conferenciaController.dart';
import 'package:qualis_ic/models/conferencia.dart';
import 'package:qualis_ic/service/atualizaJson.dart';
import 'package:qualis_ic/main.dart';

class ConferenciasPage extends StatefulWidget {
  const ConferenciasPage({Key? key}) : super(key: key);

  @override
  _ConferenciasPageState createState() => _ConferenciasPageState();
}

class _ConferenciasPageState extends State<ConferenciasPage> {
  final controller = ConferenciaController();

  @override
  void initState() {
    controller.fetchConferencias();
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
          'Conferências',
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
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Conferencia>>(
        valueListenable: controller.conferencias,
        builder: (context, conferenciasList, child) {
          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Text('Siglas', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text('Conferências', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
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
                  itemCount: conferenciasList.length,
                  itemBuilder: (context, index) {
                    final conferencia = conferenciasList[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(conferencia.sigla ?? 'Sem sigla', style: TextStyle(fontSize: 8)),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(conferencia.conferencia ?? 'Sem conferência', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10), // Espaço adicional entre a segunda e a terceira coluna
                            SizedBox(
                              width: 50,
                              child: Text(conferencia.extratoCAPES ?? 'Sem extrato CAPES', style: TextStyle(fontSize: 8)),
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
