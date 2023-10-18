// ignore: file_names
import 'dart:convert';

import 'package:qualis_ic/models/todos.dart';
import 'package:flutter/services.dart';

class TodosService {
  Future<List<Todos>> getTodos() async {
    try {
      final response = await rootBundle.loadString('lib/data/todos1.json');
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

