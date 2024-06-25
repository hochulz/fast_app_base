import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/screen/main/tab/todo/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:after_layout/after_layout.dart';

import '../../../../common/widget/w_round_button.dart';
import '../../../../common/widget/w_rounded_container.dart';

class WriteToDoDialog extends DialogWidget<WriteToDoResult> {
  WriteToDoDialog({super.key});

  @override
  DialogState<WriteToDoDialog> createState() => _WriteToDoDialogState();
}

class _WriteToDoDialogState extends DialogState<WriteToDoDialog>
    with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        radiusGeometry: const BorderRadius.only(topLeft: Radius.circular(35)),
        child: Column(
          children: [
            Row(
              children: [
                '할일을 작성해주세요'.text.size(18).bold.make(),
                const Spacer(),
                _selectedDate.formattedDate.text.make(),
                IconButton(
                    onPressed: () {
                      _selectDate();
                    },
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  focusNode: node,
                  controller: textController,
                )),
                RoundButton(
                  text: '추가',
                  onTap: () {
                    widget.hide(
                        WriteToDoResult(_selectedDate, textController.text));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _selectedDate.subtract(const Duration(days: 360)),
        lastDate: _selectedDate.add(const Duration(days: 360)));
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    AppKeyboardUtil.show(context, node);
  }
}
