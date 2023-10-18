import 'package:flutter/foundation.dart';

import 'package:qualis_ic/models/todos.dart';
import 'package:qualis_ic/service/todosService.dart';

class TodosController {
  final todos = ValueNotifier<List<Todos>>([]);

  Future<void> fetchTodos() async {
    final service = TodosService();
    final fetchedTodos = await service.getTodos();
    todos.value = fetchedTodos;
  }

  getTodos() {
    return todos;
  }
}




/*

class TodosController {
  final ValueNotifier<Todos> todos = ValueNotifier<Todos>(Todos(
          issn:
              'pelo valor desejado')
      );

  Future<void> fetchTodos() async {
    final service = TodosService();
    final fetchedTodos = await service.getTodos();
    todos.value = fetchedTodos;
  }
}
*/