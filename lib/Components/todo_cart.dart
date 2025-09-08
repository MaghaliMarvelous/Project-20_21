import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;
  final bool showCheckbox;

  const TodoCard({
    super.key,
    required this.todo,
    this.onToggle,
    this.onDelete,
    this.showCheckbox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: showCheckbox
            ? Checkbox(
                value: todo.isDone,
                onChanged: (_) => onToggle?.call(),
                activeColor: Colors.pinkAccent,
              )
            : const Icon(Icons.history, color: Colors.pinkAccent),
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration:
                todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text("${todo.description} • ${todo.category}"),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: onDelete,
              )
            : null,
      ),
    );
  }
}
