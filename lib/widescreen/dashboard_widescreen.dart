import 'package:flutter/material.dart';
import 'package:flutter_project_20_21_ulangan/pages/add_todo_page.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../models/todo.dart';

class DashboardWidescreen extends StatelessWidget {
  const DashboardWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      final todos = controller.todos;

      return Scaffold(
        appBar: AppBar(title: const Text("Todo List (Wide)")),
        body: todos.isEmpty
            ? const Center(child: Text("No todos yet."))
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
