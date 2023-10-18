import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/todosController.dart';
import 'package:qualis_ic/models/todos.dart';
import 'package:qualis_ic/views/conferencias_list.dart'; // Importe a classe ConferenciasPage

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final controller = TodosController();

  @override
  void initState() {
    controller.fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: const Text(
          'Todos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Todos>>(
        valueListenable: controller.todos,
        builder: (context, todosList, child) {
          return ListView.builder(
            itemCount: todosList.length,
            itemBuilder: (context, index) {
              final todo = todosList[index];
              return ListTile(
                title: Text(todo.periodico ?? 'Sem título'),
                subtitle: Text(todo.area ?? 'Sem área'),
              );
            },
          );
        },
      ),
    );
  }
}
