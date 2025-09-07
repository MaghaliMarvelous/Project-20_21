import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'dashboard_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // ✅ Shared state
  final List<Todo> todos = [];
  final List<Todo> history = [];

  void _addTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void _toggleDone(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  void _delete(int index) {
    setState(() {
      final removed = todos.removeAt(index);
      history.add(removed); // move to history
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      DashboardPage(
        todos: todos,
        onAdd: _addTodo,
        onToggle: _toggleDone,
        onDelete: _delete,
      ),
      HistoryPage(history: history),
      const ProfilePage(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pink,   
        unselectedItemColor: Colors.grey, 
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
