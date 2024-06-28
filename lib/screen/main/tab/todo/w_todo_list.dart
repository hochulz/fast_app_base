import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TodoDataHolder.of(context).notifier,
      builder: (context, list, child) {
        return list.isEmpty
            ? '할일을 작성해 보세요'.text.size(30).makeCentered()
            : Column(
                children: list.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
