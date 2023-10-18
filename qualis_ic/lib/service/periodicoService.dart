import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:qualis_ic/models/periodico.dart';

class PeriodicosService {
  Future<List<Periodico>> getPeriodicos() async {
    try {
      final response = await rootBundle.loadString('lib/data/periodico.json');
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
