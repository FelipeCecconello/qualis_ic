// ignore: file_names
import 'dart:convert';
import 'package:qualis_ic/models/todos.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TodosService {
  Future<List<Todos>> getTodos() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String filePath = '${documentsDirectory.path}/todos2.json';
      final response = await File(filePath).readAsString();
      final decoded = json.decode(response);

      final todosList = (decoded['data'] as List)
          .map((item) => Todos.fromJson(item))
          .toList();

      return todosList;
    } catch (e) {
      print('Erro ao carregar e decodificar o JSON: $e');
      rethrow;
    }
  }
}

