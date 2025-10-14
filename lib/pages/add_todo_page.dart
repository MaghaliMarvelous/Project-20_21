import 'package:flutter/material.dart';
import '../models/todo.dart';

class AddTodoPage extends StatefulWidget {
  final Todo? todo; // ✅ nullable todo for edit mode
  const AddTodoPage({super.key, this.todo});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // ✅ If editing, prefill fields
    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
      _selectedCategory = widget.todo!.category;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final updatedTodo = Todo(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory ?? "General",
        isDone: widget.todo?.isDone ?? false, // ✅ preserve status
      );
      Navigator.pop(context, updatedTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Todo" : "Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter a title" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: const [
                  DropdownMenuItem(value: "General", child: Text("General")),
                  DropdownMenuItem(value: "School", child: Text("School")),
                  DropdownMenuItem(value: "Work", child: Text("Work")),
                  DropdownMenuItem(value: "Personal", child: Text("Personal")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select a category" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                ),
                child: Text(
                  isEditing ? "Save Changes" : "Add Todo",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
