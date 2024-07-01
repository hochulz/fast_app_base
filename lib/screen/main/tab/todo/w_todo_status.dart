import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:flutter/material.dart';

import '../../../../data/memory/vo_todo.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => TodoDataHolder.of(context).notifier.toggleTodoStatus(todo),
      child: SizedBox(
          width: 50,
          height: 50,
          child: switch (todo.status) {
            // TODO: Handle this case.
            TodoStatus.incomplete => const Checkbox(
                value: false,
                onChanged: null,
              ),
            // TODO: Handle this case.
            TodoStatus.complete => Checkbox(
              value: true,
              onChanged: null,
              fillColor:
              WidgetStateProperty.all(context.appColors.checkBoxColor),
            ),
            // TODO: Handle this case.
            TodoStatus.ongoing => Checkbox(
              value: false,
              onChanged: null,
              fillColor:
              WidgetStateProperty.all(context.appColors.checkBoxColor),
            ),
          }),
    );
  }
}
