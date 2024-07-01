import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    value.remove(todo);
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음상태로 변경하시겠습니까?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }
    notifyListeners();
  }
}
