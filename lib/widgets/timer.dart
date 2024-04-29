import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoroing/utils/timerstatus.dart';
import 'package:provider/provider.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final controller = CountDownController();
  int duration = 15;
  String initialDuration = "00:15";
  bool TimerStatus = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerStatusNotifier(),
      child: Consumer<TimerStatusNotifier>(
        builder: (context, TimerStatusNotifier, _) {
          return Column(
            children: [
              CircularCountDownTimer(
                duration: duration,
                controller: controller,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                fillGradient: null,
                backgroundColor: Theme.of(context).colorScheme.primary,
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inMilliseconds == 0) {
                    TimerStatusNotifier.setPlaying(false);
                    // 修正必須 タイマーが終了したタイミングでボタン表示が変わらない
                    return initialDuration;
                  } else {
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (TimerStatusNotifier.isPlaying) {
                          controller.pause();
                          TimerStatusNotifier.setPlaying(false);
                        } else if (controller.isPaused) {
                          controller.resume();
                          TimerStatusNotifier.setPlaying(true);
                        } else {
                          controller.start();
                          TimerStatusNotifier.setPlaying(true);
                        }
                      },
                      child: Icon(TimerStatusNotifier.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow)),
                  ElevatedButton(
                      onPressed: () => controller.reset(),
                      child: const Icon(Icons.restart_alt))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
