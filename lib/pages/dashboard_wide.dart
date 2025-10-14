import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import '../controllers/dashboard_controller.dart';
import 'add_todo_page.dart';

class DashboardWidePage extends StatelessWidget {
  const DashboardWidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      final todos = controller.todos;

      return todos.isEmpty
          ? Center(
              child: Text(
                "No todos yet. Tap + to add.",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
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
                          fontWeight: FontWeight.bold,
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
                            icon: Icon(Icons.edit,
                                color: todo.isDone ? Colors.white : Colors.pinkAccent),
                            onPressed: () async {
                              final updatedTodo = await Navigator.push<Todo>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddTodoPage(todo: todo),
                                ),
                              );
                              if (updatedTodo != null) {
                                controller.editTodo(index, updatedTodo);
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,
                                color: todo.isDone
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.secondary),
                            onPressed: () => controller.delete(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
