import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'add_todo_page.dart';

class DashboardPage extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo) onAdd;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const DashboardPage({
    super.key,
    required this.todos,
    required this.onAdd,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // white background
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.pink, // pink text
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final newTodo = await Navigator.push<Todo>(
                context,
                MaterialPageRoute(builder: (_) => const AddTodoPage()),
              );
              if (newTodo != null) onAdd(newTodo);
            },
            child: const Text(
              "+ Add",
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.pink),
      ),
      body: todos.isEmpty
          ? const Center(
              child: Text(
                "No todos yet. Tap + Add to add.",
                style: TextStyle(color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Checkbox(
                      activeColor: Colors.pink,
                      value: todo.isDone,
                      onChanged: (_) => onToggle(index),
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text("${todo.description} • ${todo.category}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.pink),
                      onPressed: () => onDelete(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
