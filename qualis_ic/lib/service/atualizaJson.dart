import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<void> atualizarJSONs(BuildContext context) async {
  final conferenciasUrl = 'https://qualis.ic.ufmt.br/qualis_conferencias_2016.json';
  final periodicosUrl = 'https://qualis.ic.ufmt.br/periodico.json';
  final todosUrl = 'https://qualis.ic.ufmt.br/todos2.json';

  try {
    final conferenciasResponse = await http.get(Uri.parse(conferenciasUrl), headers: {'Accept-Charset': 'utf-8'},);
    final periodicosResponse = await http.get(Uri.parse(periodicosUrl), headers: {'Accept-Charset': 'utf-8'},);
    final todosResponse = await http.get(Uri.parse(todosUrl), headers: {'Accept-Charset': 'utf-8'},);

    if (conferenciasResponse.statusCode == 200 &&
        periodicosResponse.statusCode == 200 &&
        todosResponse.statusCode == 200) {

      final conferenciasData = json.decode(utf8.decode(conferenciasResponse.bodyBytes));
      final periodicosData = json.decode(utf8.decode(periodicosResponse.bodyBytes));
      final todosData = json.decode(utf8.decode(todosResponse.bodyBytes));


      final appDocumentsDirectory = await getApplicationDocumentsDirectory();

      final conferenciasFile = File('${appDocumentsDirectory.path}/conferencia.json');
      await conferenciasFile.writeAsString(jsonEncode(conferenciasData));

      final periodicosFile = File('${appDocumentsDirectory.path}/periodico.json');
      await periodicosFile.writeAsString(jsonEncode(periodicosData));

      final todosFile = File('${appDocumentsDirectory.path}/todos2.json');
      await todosFile.writeAsString(jsonEncode(todosData));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('JSONs atualizados com sucesso!'),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao baixar os JSONs'),
          duration: const Duration(seconds: 3),
        ),
      );
      print('Erro ao baixar os JSONs');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro: $e'),
        duration: const Duration(seconds: 3),
      ),
    );
    print('Erro: $e');
  }
}

Future<void> copyAssetsToDocumentsDirectory() async {
  try {
    List<String> assetPaths = [
      'lib/data/todos2.json',
      'lib/data/periodico.json',
      'lib/data/conferencia.json',
    ];

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    for (String assetPath in assetPaths) {
      String assetName = assetPath.split('/').last;
      String destinationPath = '${documentsDirectory.path}/$assetName';

      ByteData data = await rootBundle.load(assetPath);

      final buffer = data.buffer.asUint8List();
      File destinationFile = File(destinationPath);

      if (await destinationFile.exists()) {
        await destinationFile.delete();
        print('Arquivo antigo removido em: $destinationPath');
      }

      await destinationFile.writeAsBytes(buffer, flush: true);
      print('Arquivo copiado para: $destinationPath');
    }
  } catch (e) {
    print('Erro ao copiar arquivos: $e');
  }
}