import 'dart:convert';
import 'package:qualis_ic/models/periodico.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PeriodicosService {
  Future<List<Periodico>> getPeriodicos() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String filePath = '${documentsDirectory.path}/periodico.json';
      final response = await File(filePath).readAsString();
      final decoded = json.decode(response);

      final periodicosList = (decoded['data'] as List)
          .map((item) => Periodico.fromJson(item))
          .toList();

      return periodicosList;
    } catch (e) {
      print('Erro ao carregar e decodificar o JSON de periódicos: $e');
      rethrow;
    }
  }
}
