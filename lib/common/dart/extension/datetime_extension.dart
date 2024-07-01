

import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    final now = DateTime.now();
    final difference = this.difference(now).inDays;

    if (difference > 0) {
      return '$difference일 남았습니다';
    } else if (difference < 0) {
      return '${difference.abs()}일 지났습니다';
    } else {
      return '오늘까지 입니다';
    }
  }
}
