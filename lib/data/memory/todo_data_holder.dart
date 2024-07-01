import 'package:fast_app_base/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

import '../../screen/main/tab/todo/d_write_todo.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({required this.notifier, required super.child, super.key});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static TodoDataHolder of(BuildContext context) {
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  void editTodo(Todo todo) async {
    final result = await WriteToDoDialog(editTodo: todo,).show();
    if (result != null) {
      notifier.addTodo(Todo(
        id : DateTime.now().microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.date,
      ));
    }
  }
}