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
      final player =
          _players.firstWhere((element) => element.name == event.playerName);
      final modifiedPlayer = player.copyWith(
        nextTurnOrderPosition: _findTurnOrderPosition(),
        isPassed: !player.isPassed,
      );

      _players[_players.indexOf(player)] = modifiedPlayer;
      emit(PlayersLoadedState(List.from(_players)));
    });

    on<StartNextTurn>((event, emit) {
      for (final player in _players) {
        _players[_players.indexOf(player)] = player.copyWith(
          currentTurnOrderPosition: player.nextTurnOrderPosition,
          nextTurnOrderPosition: 0,
          isPassed: false,
        );
      }
      _players.sort((a, b) =>
          a.currentTurnOrderPosition.compareTo(b.currentTurnOrderPosition));
      emit(PlayersLoadedState(List.from(_players)));
    });
  }
}
