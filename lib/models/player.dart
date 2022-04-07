import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Player extends Equatable {
  final String name;
  final Color color;
  final int currentTurnOrderPosition;
  final int nextTurnOrderPosition;
  final bool isPassed;

  Player({
    required this.name,
    required this.color,
    required this.currentTurnOrderPosition,
    this.nextTurnOrderPosition = 0,
    this.isPassed = false,
  });

  @override
  String toString() {
    return '$name: $color, $currentTurnOrderPosition pos, passed: $isPassed, next: $nextTurnOrderPosition';
  }

  Player copyWith({
    String? name,
    Color? color,
    int? currentTurnOrderPosition,
    int? nextTurnOrderPosition,
    bool? isPassed,
  }) {
    return Player(
      name: name ?? this.name,
      color: color ?? this.color,
      currentTurnOrderPosition:
          currentTurnOrderPosition ?? this.currentTurnOrderPosition,
      nextTurnOrderPosition:
          nextTurnOrderPosition ?? this.nextTurnOrderPosition,
      isPassed: isPassed ?? this.isPassed,
    );
  }

  @override
  List<Object?> get props => [
        name,
        color,
        currentTurnOrderPosition,
        nextTurnOrderPosition,
        isPassed,
      ];
}
