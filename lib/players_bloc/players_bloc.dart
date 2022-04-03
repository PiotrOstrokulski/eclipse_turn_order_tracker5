import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eclipse_turn_order_tracker5/models/player.dart';
import 'package:equatable/equatable.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  List<Player> _players = <Player>[];

  int _findTurnOrderPosition() {
    int turnOrderPosition = 1;
    for (final player in _players) {
      if (player.isPassed) {
        turnOrderPosition++;
      }
    }
    return turnOrderPosition;
  }

  PlayersBloc() : super(PlayersLoadedState([])) {
    on<InitializePlayers>((event, emit) {
      _players = event.players;
      _players.sort((a, b) =>
          a.currentTurnOrderPosition.compareTo(b.currentTurnOrderPosition));
      emit(PlayersLoadedState(List.from(_players)));
    });

    on<SwitchPlayerPass>((event, emit) {
      _players.firstWhere((element) => element.name == event.playerName)
        ..nextTurnOrderPosition = _findTurnOrderPosition()
        ..switchPass();

      emit(PlayersLoadedState(List.from(_players)));
    });

    on<StartNextTurn>((event, emit) {
      for (final player in _players) {
        player.currentTurnOrderPosition = player.nextTurnOrderPosition;
        player.nextTurnOrderPosition = 0;
      }
      _players.sort((a, b) =>
          a.currentTurnOrderPosition.compareTo(b.currentTurnOrderPosition));
      emit(PlayersLoadedState(List.from(_players)));
    });
  }
}
