import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int count;
  const CounterWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Counter: $count",
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
