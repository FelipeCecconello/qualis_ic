import 'package:flutter/foundation.dart';
import 'package:qualis_ic/models/conferencia.dart';
import 'package:qualis_ic/service/conferenciaService.dart';

class ConferenciaController {
  final conferencias = ValueNotifier<List<Conferencia>>([]);

  Future<void> fetchConferencias() async {
    final service = ConferenciaService();
    final fetchedConferencias = await service.getConferencias();
    conferencias.value = fetchedConferencias;
  }

  ValueNotifier<List<Conferencia>> getConferencias() {
    return conferencias;
  }
}
