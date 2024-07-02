import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../screen/dialog/d_confirm.dart';
import '../../screen/main/tab/todo/d_write_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;


  void editTodo(Todo todo) async {
    final result = await WriteToDoDialog(editTodo: todo,).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.date;
      todoList.refresh();
    }
  }

  void addTodo() async {
    final result = await WriteToDoDialog().show();
    if (result != null) {
      todoList.add(Todo(
        id : DateTime.now().microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.date,
      ));
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
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
    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}