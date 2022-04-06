import 'package:bloc_test/bloc_test.dart';
import 'package:eclipse_turn_order_tracker5/models/player.dart';
import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  late PlayersBloc playersBloc;
  late List<Player> players;

  setUp(() {
    playersBloc = PlayersBloc();
    players = [
      Player(
        currentTurnOrderPosition: 1,
        color: Colors.red,
        name: 'Jan',
        isPassed: false,
        nextTurnOrderPosition: 2,
      ),
      Player(
        currentTurnOrderPosition: 2,
        color: Colors.green,
        name: 'Piotr',
        isPassed: false,
        nextTurnOrderPosition: 1,
      ),
    ];
  });

  blocTest<PlayersBloc, PlayersState>(
    "created bloc doesn't emit any state",
    build: () => playersBloc,
    act: (bloc) {},
    expect: () => [],
  );

  blocTest<PlayersBloc, PlayersState>(
    "InitializePlayers emits PlayersLoadedState with players",
    build: () => playersBloc,
    act: (bloc) => bloc.add(InitializePlayers(players)),
    expect: () => [PlayersLoadedState(players)],
  );

  late List<Player> passedPlayers = [
    Player(
      currentTurnOrderPosition: 1,
      color: Colors.red,
      name: 'Jan',
      isPassed: true,
      nextTurnOrderPosition: 3,
    ),
    Player(
      currentTurnOrderPosition: 2,
      color: Colors.green,
      name: 'Piotr',
      isPassed: true,
      nextTurnOrderPosition: 1,
    ),
    Player(
      currentTurnOrderPosition: 3,
      color: Colors.yellow,
      name: 'Pawel',
      isPassed: true,
      nextTurnOrderPosition: 2,
    ),
  ];

  blocTest<PlayersBloc, PlayersState>(
    "StartNextTurn emits [PlayersLoadedState] with unpassed players, correct current turn order and zeroed next turn order",
    build: () => playersBloc,
    act: (bloc) {
      bloc.setPlayers(passedPlayers);
      bloc.add(StartNextTurn());
    },
    expect: () => [
      PlayersLoadedState([
        Player(
          currentTurnOrderPosition: 1,
          color: Colors.green,
          name: 'Piotr',
          isPassed: false,
          nextTurnOrderPosition: 0,
        ),
        Player(
          currentTurnOrderPosition: 2,
          color: Colors.yellow,
          name: 'Pawel',
          isPassed: false,
          nextTurnOrderPosition: 0,
        ),
        Player(
          currentTurnOrderPosition: 3,
          color: Colors.red,
          name: 'Jan',
          isPassed: false,
          nextTurnOrderPosition: 0,
        ),
      ]),
    ],
  );
}
