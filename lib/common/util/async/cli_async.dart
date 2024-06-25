import 'dart:async';

// 주어진 함수를 지정된 시간(duration) 후에 실행하는 타이머를 반환
Timer delayTimer(Function func, [Duration duration = const Duration(milliseconds: 50)]) {
  return Timer(duration, () {
    func();
  });
}

// 주어진 시간(duration) 동안 비동기적으로 지연
Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}

// 조건 함수(predict)가 참인 동안 주어진 시간(duration) 동안 반복적으로 지연
Future sleepWhile(bool Function() predict, [Duration duration = const Duration(milliseconds: 50)]) async {
  while (predict()) {
    await sleepAsync(duration);
  }
}

// 조건 함수(predict)가 거짓인 동안 주어진 시간(duration) 동안 반복적으로 지연
Future sleepUntil(bool Function() predict, [Duration duration = const Duration(milliseconds: 50)]) async {
  while (!predict()) {
    await sleepAsync(duration);
  }
}

class DelayTarget {
  Function? targetFunction;  // 실행할 함수를 저장
  Timer? _timer;  // 타이머 객체를 저장

  /// 마지막에 지정된 targetFunction을 무시하고 새로운 함수를 지연 실행
  void delay(Function function) {
    targetFunction = function;  // 실행할 함수를 저장
    if (_timer != null) {
      _timer!.cancel();  // 기존 타이머가 있으면 취소
    }
    _timer = Timer(const Duration(milliseconds: 20), () {
      if (targetFunction != null) {
        targetFunction!();  // 지연 시간 후에 함수를 실행
      }
    });
  }
}
