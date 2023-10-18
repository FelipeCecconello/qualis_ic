import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:qualis_ic/models/conferencia.dart';

class ConferenciaService {
  Future<List<Conferencia>> getConferencias() async {
    try {
      final response = await rootBundle.loadString('lib/data/conferencia.json');
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
