import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/conferenciaController.dart'; // Importe o seu controller de conferências
import 'package:qualis_ic/models/conferencia.dart'; // Importe o seu modelo de conferências

class ConferenciasPage extends StatefulWidget {
  const ConferenciasPage({Key? key}) : super(key: key);

  @override
  _ConferenciasPageState createState() => _ConferenciasPageState();
}

class _ConferenciasPageState extends State<ConferenciasPage> {
  final controller = ConferenciaController(); // Use o controller de conferências

  @override
  void initState() {
    controller.fetchConferencias(); // Chame a função para buscar as conferências
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
          'Conferências',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Conferencia>>(
        valueListenable: controller.conferencias, // Use a lista de conferências do controller
        builder: (context, conferenciasList, child) {
          return ListView.builder(
            itemCount: conferenciasList.length,
            itemBuilder: (context, index) {
              final conferencia = conferenciasList[index];
              return ListTile(
                title: Text(conferencia.conferencia ?? 'Sem título'),
                subtitle: Text(conferencia.extratoCAPES ?? 'Sem extrato CAPES'),
              );
            },
          );
        },
      ),
    );
  }
}
