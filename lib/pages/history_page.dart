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
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.pinkAccent),
          actions: [
            // tombol select
            IconButton(
              icon: Icon(
                controller.isSelectionMode.value
                    ? Icons.close
                    : Icons.check_box_outlined,
                color: Colors.pinkAccent,
              ),
              onPressed: () {
                if (history.isEmpty) {
                  Get.snackbar(
                    "No History",
                    "There are no todos to select.",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.toggleSelectionMode();
                }
              },
            ),
            if (controller.isSelectionMode.value)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: controller.selectedItems.isEmpty
                    ? null
                    : () => controller.removeSelectedFromHistory(),
              ),
          ],
        ),
        body: history.isEmpty
            ? const Center(
                child: Text(
                  "No deleted todos yet.",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final todo = history[index];
                  final isSelected =
                      controller.selectedItems.contains(index);

                  return Card(
                    color: isSelected ? Colors.pink[50] : Colors.white,
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: controller.isSelectionMode.value
                          ? Checkbox(
                              value: isSelected,
                              activeColor: Colors.pinkAccent,
                              onChanged: (_) =>
                                  controller.toggleItemSelection(index),
                            )
                          : const Icon(Icons.history,
                              color: Colors.pinkAccent),
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
                      onTap: controller.isSelectionMode.value
                          ? () => controller.toggleItemSelection(index)
                          : null,
                    ),
                  );
                },
              ),
      );
    });
  }
}
