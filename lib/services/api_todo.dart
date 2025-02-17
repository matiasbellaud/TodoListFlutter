import 'dart:convert';

import 'package:todo_list_app/models/todo/todo_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();

  ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  Future<TodoResponse> fetchTodos() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['todos'];
      return TodoResponse.fromJson({
        'todos': data,
        'total': data.length,
        'skip': 0,
        'limit': data.length,
      });
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoResponse> addTodo(String todo) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/todos/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'todo': todo, 'completed': false, 'userId': 1}),
    );
    return TodoResponse.fromJson({
      'todos': [jsonDecode(response.body)],
      'total': 1,
      'skip': 0,
      'limit': 1,
    });
  }

  Future<TodoResponse> updateTodo(int id,
      {String? newName, bool? completed}) async {
    final response = await http.put(
      Uri.parse('https://dummyjson.com/todos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': newName, 'completed': completed}),
    );
    return TodoResponse.fromJson({
      'todos': [jsonDecode(response.body)],
      'total': 1,
      'skip': 0,
      'limit': 1,
    });
  }

  Future<TodoResponse> deleteTodo(int id) async {
    final response =
        await http.delete(Uri.parse('https://dummyjson.com/todos/$id'));
    return TodoResponse.fromJson({
      'todos': [jsonDecode(response.body)],
      'total': 1,
      'skip': 0,
      'limit': 1,
    });
  }
}
