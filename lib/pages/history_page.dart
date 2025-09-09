import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      final history = controller.history;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "History",
            style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.pinkAccent),
        ),
        body: history.isEmpty
            ? const Center(child: Text("No deleted todos yet.", style: TextStyle(color: Colors.pinkAccent)))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final todo = history[index];
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                      subtitle: Text("${todo.description} • ${todo.category}", style: const TextStyle(color: Colors.black54)),
                    ),
                  );
                },
              ),
      );
    });
  }
}
