import 'package:flutter/material.dart';
import 'package:todo_app_basic/utility/local_storage.dart';
import 'package:todo_app_basic/utility/todo_model.dart';

class TodoListProvider extends ChangeNotifier {
  final List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  void init() {
    final list = LocalStorage.GetList();

    if (list.isNotEmpty) {
      _todoList.addAll(list.map((item) => TodoModel.fromJson(item)).toList());
    }
  }

  void addTodo(TodoModel todo) {
    _todoList.add(todo);
    LocalStorage().AddToList(data: todo.toJson());
    notifyListeners();
  }

  void removeTodo(int id) {
    _todoList.removeWhere(
      (todo) {
        return todo.id == id;
      }
    );

    LocalStorage().RemoveFromList(id: id);
    
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    int index = _todoList.indexWhere((item) => item.id == todo.id);
    _todoList[index] = todo;

    LocalStorage().UpdateFromList(data: todo.toJson(), id: todo.id);
    notifyListeners();
  }

  void removerAll() {
    _todoList.clear();

    LocalStorage().ClearList();
    notifyListeners();
  }
}