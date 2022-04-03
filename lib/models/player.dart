import 'package:flutter/material.dart';

class Player {
  String name;
  Color color;
  int currentTurnOrderPosition;
  int nextTurnOrderPosition;
  bool isPassed;

  Player({
    required this.name,
    required this.color,
    required this.currentTurnOrderPosition,
    this.nextTurnOrderPosition = 0,
    this.isPassed = false,
  });

  @override
  String toString() {
    return '$name has $color color, his position is $currentTurnOrderPosition and his pass state is $isPassed';
  }

  void switchPass() {
    isPassed = !isPassed;
  }
}
