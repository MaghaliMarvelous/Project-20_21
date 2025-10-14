import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../models/todo.dart';
import '../pages/add_todo_page.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Obx(() {
      final todos = controller.todos;

      return Scaffold(
        appBar: AppBar(title: const Text("Todo List")),
        body: todos.isEmpty
            ? const Center(child: Text("No todos yet."))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    color: todo.isDone ? Colors.pinkAccent : Theme.of(context).cardColor,
                    child: ListTile(
                      leading: Checkbox(
                        value: todo.isDone,
                        activeColor: Colors.pinkAccent,
                        onChanged: (_) => controller.toggleDone(index),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone ? TextDecoration.lineThrough : null,
                          color: todo.isDone ? Colors.white : null,
                        ),
                      ),
                      subtitle: Text(
                        "${todo.description} • ${todo.category}",
                        style: TextStyle(color: todo.isDone ? Colors.white70 : null),
                      ),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: todo.isDone ? Colors.white : Colors.pinkAccent),
                            onPressed: () async {
                              final updated = await Navigator.push<Todo>(
                                context,
                                MaterialPageRoute(builder: (_) => AddTodoPage(todo: todo)),
                              );
                              if (updated != null) controller.editTodo(index, updated);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,
                                color: todo.isDone ? Colors.white : Theme.of(context).colorScheme.secondary),
                            onPressed: () => controller.delete(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: const Icon(Icons.add),
          onPressed: () async {
            final newTodo = await Navigator.push<Todo>(
              context,
              MaterialPageRoute(builder: (_) => const AddTodoPage()),
            );
            if (newTodo != null) controller.addTodo(newTodo);
          },
        ),
      );
    });
  }
}
