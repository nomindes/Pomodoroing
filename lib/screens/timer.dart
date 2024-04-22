import 'package:flutter/material.dart';
import 'package:pomodoroing/widgets/customappbar.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
