import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_app/services/api_todo.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoResponse with _$TodoResponse {
  factory TodoResponse({
    required List<Todo> todos,
    required int total,
    required int skip,
    required int limit,
  }) = _TodoResponse;

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);
}

@freezed
class Todo with _$Todo {
  factory Todo({
    required int id,
    required String todo,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]) {
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final response = await ApiService().fetchTodos();
      state = response.todos;
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTodo(String todo) async {
    try {
      final response = await ApiService().addTodo(todo);
      state = [...state, ...response.todos];
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTodo(int id, String? newName, bool? completed) async {
    try {
      await ApiService().updateTodo(id, newName: newName, completed: completed);
      state = state.map((todo) {
        if (todo.id == id) {
          return Todo(
            id: todo.id,
            todo: newName ?? todo.todo,
            completed: completed ?? todo.completed,
          );
        }
        return todo;
      }).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await ApiService().deleteTodo(id);
      state = state.where((todo) => todo.id != id).toList();
    } catch (e) {
      print(e);
    }
  }
}

final todosProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());
