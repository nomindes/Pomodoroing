import 'package:flutter/material.dart';
import 'package:pomodoroing/widgets/customappbar.dart';
import 'package:pomodoroing/widgets/timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Timer()),
    );
  }
}
