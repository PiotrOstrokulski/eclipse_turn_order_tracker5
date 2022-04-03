import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:eclipse_turn_order_tracker5/widgets/filled_player_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tracker_page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PlayersBloc, PlayersState>(
              builder: (context, state) {
                if (state is PlayersLoadedState) {
                  return ListView.builder(
                    itemCount: state.players.length,
                    itemBuilder: (context, index) {
                      return FilledPlayerTile(
                        state.players[index],
                      );
                    },
                  );
                }
                return Container(
                  child: Text('abc'),
                );
              },
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            onPressed: () {
              final bloc = context.read<PlayersBloc>();
              bloc.add(StartNextTurn());
            },
            child: Text('next turn'),
          ),
        ],
      ),
    );
  }
}
