import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/models/todo/todo_model.dart';

class ListTodo extends ConsumerWidget {
  const ListTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.todo),
          onTap: () => _showEditDialog(context, ref, todo),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(todo.completed ? Icons.check : Icons.close,
                    color: todo.completed ? Colors.green : Colors.red),
                onPressed: () => ref
                    .read(todosProvider.notifier)
                    .updateTodo(todo.id, todo.todo, !todo.completed),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    ref.read(todosProvider.notifier).deleteTodo(todo.id),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, Todo todo) {
    final TextEditingController controller =
        TextEditingController(text: todo.todo);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Todo Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  ref
                      .read(todosProvider.notifier)
                      .updateTodo(todo.id, controller.text, todo.completed);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
