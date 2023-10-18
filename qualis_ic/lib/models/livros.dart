import 'package:flutter/material.dart';

// ignore: camel_case_types
class Livro {
  final String id;
  final String? nome;
  final String? conteudo;

  const Livro({
    required this.id,
    @required this.nome,
    this.conteudo,
  });
}
