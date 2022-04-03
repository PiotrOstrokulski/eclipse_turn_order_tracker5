part of 'players_bloc.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();
}

class InitializePlayers extends PlayersEvent {
  InitializePlayers(this.players);
  final List<Player> players;
  @override
  List<Object?> get props => [players];
}

class SwitchPlayerPass extends PlayersEvent {
  final String playerName;
  SwitchPlayerPass(this.playerName);

  @override
  List<Object?> get props => [playerName];
}

class StartNextTurn extends PlayersEvent {
  @override
  List<Object?> get props => [];
}
