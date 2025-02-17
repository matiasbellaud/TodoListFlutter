import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/add_todo/add_todo.dart';
import 'package:todo_list_app/widgets/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Todos List')),
      body: ListTodo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
