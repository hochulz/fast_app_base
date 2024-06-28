import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/memory/vo_todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          todo.dueDate.formattedDate.text.make(),
          Row(
            children: [
              TodoStatusWidget(todo),
              Expanded(child: todo.title.text.size(20).medium.make()),
              IconButton(
                  onPressed: () async {},
                  icon: const Icon(EvaIcons.editOutline)),
            ],
          )
        ],
      ).pOnly(top:15, bottom:10, left:5, right:15),
    );
  }
}
