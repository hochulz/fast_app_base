import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/color_extension.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_list.dart';
import 'package:flutter/material.dart';

class ToDoFragment extends StatefulWidget {
  const ToDoFragment({super.key});

  @override
  State<ToDoFragment> createState() => _ToDoFragmentState();
}

class _ToDoFragmentState extends State<ToDoFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.seedColor.getSwatchByBrightness(100),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              )
            ],
          ),
          Expanded(
            child: TodoList().pSymmetric(h: 15),
          )
        ],
      ),
    );
  }
}
