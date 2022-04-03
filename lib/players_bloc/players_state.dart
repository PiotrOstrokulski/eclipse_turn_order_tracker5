part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  const PlayersState();
}

class PlayersLoadedState extends PlayersState {
  PlayersLoadedState(this.players);
  final List<Player> players;
  @override
  List<Object?> get props => [players];
}
