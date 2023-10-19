import 'dart:convert';
import 'package:qualis_ic/models/conferencia.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ConferenciaService {
  Future<List<Conferencia>> getConferencias() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String filePath = '${documentsDirectory.path}/conferencia.json';
      final response = await File(filePath).readAsString();
      final decoded = json.decode(response);

      final conferenciasList = (decoded['data'] as List)
          .map((item) => Conferencia.fromJson(item))
          .toList();

      return conferenciasList;
    } catch (e) {
      print('Erro ao carregar e decodificar o JSON de conferências: $e');
      rethrow;
    }
  }
}
