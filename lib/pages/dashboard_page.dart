import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo.dart';
import '../controllers/dashboard_controller.dart';
import 'add_todo_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      final todos = controller.todos;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final newTodo = await Navigator.push<Todo>(
                  context,
                  MaterialPageRoute(builder: (_) => const AddTodoPage()),
                );
                if (newTodo != null) controller.addTodo(newTodo);
              },
              child: const Text(
                "+ Add",
                style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.pink),
        ),
        body: todos.isEmpty
            ? const Center(child: Text("No todos yet. Tap + Add to add."))
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: Checkbox(
                        activeColor: Colors.pink,
                        value: todo.isDone,
                        onChanged: (_) => controller.toggleDone(index),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text("${todo.description} • ${todo.category}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.pink),
                        onPressed: () => controller.delete(index),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
