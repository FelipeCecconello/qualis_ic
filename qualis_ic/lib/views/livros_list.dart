import 'package:flutter/material.dart';
import 'package:qualis_ic/controller/todosController.dart';
import 'package:qualis_ic/models/todos.dart';
import 'package:qualis_ic/service/atualizaJson.dart';
import 'package:qualis_ic/main.dart';

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
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Correlação',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await atualizarJSONs(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                    (route) => false,
              );
            },
            child: Text('Atualizar'),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Todos>>(
        valueListenable: controller.todos,
        builder: (context, todosList, child) {
          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: Text('ISSN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Text('Periódico', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    child: Text('CAPES Comp', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 40,
                    child: Text('CAPES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Text('Área', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todosList.length,
                  itemBuilder: (context, index) {
                    final todo = todosList[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: Text(todo.issn ?? 'Sem ISSN', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(todo.periodico ?? 'Sem Periódico', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 40,
                              child: Text(todo.extratoCAPESComp ?? 'Sem Extrato CAPES Comp', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 40,
                              child: Text(todo.extratoCAPES ?? 'Sem Extrato CAPES', style: TextStyle(fontSize: 8)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(todo.area ?? 'Sem Área', style: TextStyle(fontSize: 8)),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
