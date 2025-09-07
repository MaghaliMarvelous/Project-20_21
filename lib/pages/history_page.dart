import 'package:flutter/material.dart';
import '../models/todo.dart';

class HistoryPage extends StatelessWidget {
  final List<Todo> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white, 
        elevation: 0, // flat style
        centerTitle: true,
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.pinkAccent, 
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "No deleted todos yet.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pinkAccent, 
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final todo = history[index];
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.pinkAccent),
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      "${todo.description} • ${todo.category}",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
