part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  const PlayersState();
}

class PlayersLoadedState extends PlayersState {
  final List<Player> players;
  PlayersLoadedState(this.players);

  @override
  List<Object?> get props => [players];
}
