import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_20_21_ulangan/controllers/history_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HistoryWidescreen extends StatelessWidget {
  const HistoryWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Obx(() {
      final history = controller.history;

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("History (Wide)", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(
                controller.isSelectionMode.value ? Icons.close : Icons.check_box_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                if (history.isEmpty) {
                  Get.snackbar("History Empty", "There are no deleted todos to select.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.grey.shade800,
                      colorText: Colors.white);
                } else {
                  controller.toggleSelectionMode();
                }
              },
            ),
            if (controller.isSelectionMode.value)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  if (controller.selectedItems.isEmpty) {
                    Get.snackbar("No Selection", "Please select items to delete.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.grey.shade800,
                        colorText: Colors.white);
                  } else {
                    controller.removeSelectedFromHistory();
                  }
                },
              ),
          ],
        ),
        body: history.isEmpty
            ? Center(
                child: Text("No deleted todos yet.",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
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
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final todo = history[index];
                    final isSelected = controller.selectedItems.contains(index);

                    return Card(
                      elevation: isSelected ? 4 : 1,
                      color: isSelected ? Colors.pinkAccent : Theme.of(context).cardColor,
                      child: ListTile(
                        leading: controller.isSelectionMode.value
                            ? Checkbox(
                                value: isSelected,
                                activeColor: Colors.white,
                                checkColor: Colors.pinkAccent,
                                onChanged: (_) => controller.toggleItemSelection(index),
                              )
                            : Icon(Icons.history,
                                color: Theme.of(context).colorScheme.secondary),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: isSelected ? Colors.white : null,
                          ),
                        ),
                        subtitle: Text(
                          "${todo.description} • ${todo.category}",
                          style: TextStyle(color: isSelected ? Colors.white70 : null),
                        ),
                        onTap: controller.isSelectionMode.value
                            ? () => controller.toggleItemSelection(index)
                            : null,
                      ),
                    );
                  },
                ),
              ),
      );
    });
  }
}
