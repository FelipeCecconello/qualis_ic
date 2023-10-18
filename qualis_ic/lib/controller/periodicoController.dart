import 'package:flutter/foundation.dart';
import 'package:qualis_ic/models/periodico.dart';
import 'package:qualis_ic/service/periodicoService.dart';

class PeriodicosController {
  final periodicos = ValueNotifier<List<Periodico>>([]);

  Future<void> fetchPeriodicos() async {
    final service = PeriodicosService();
    final fetchedPeriodicos = await service.getPeriodicos();
    periodicos.value = fetchedPeriodicos;
  }

  ValueListenable<List<Periodico>> getPeriodicos() {
    return periodicos;
  }
}
