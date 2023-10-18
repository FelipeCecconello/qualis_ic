import 'package:flutter/material.dart';

// ignore: camel_case_types
class Conferencia {
  final String? sigla;
  final String? conferencia;
  final String? extratoCAPES;

  Conferencia({
    this.sigla,
    this.conferencia,
    this.extratoCAPES,
  });

  factory Conferencia.fromJson(List<dynamic> json) {
    return Conferencia(
      sigla: json[0],
      conferencia: json[1],
      extratoCAPES: json[2],
    );
  }
}

