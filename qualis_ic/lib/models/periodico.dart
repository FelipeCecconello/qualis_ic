import 'package:flutter/material.dart';

class Periodico {
  final String issn;
  final String? nome;
  final String? extratoCAPES;

  Periodico({
    required this.issn,
    this.nome,
    this.extratoCAPES,
  });

  factory Periodico.fromJson(List<dynamic> json) {
    return Periodico(
      issn: json[0] ,
      nome: json[1],
      extratoCAPES: json[2],
    );
  }
}
