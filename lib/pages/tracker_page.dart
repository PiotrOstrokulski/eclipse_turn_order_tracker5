import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:eclipse_turn_order_tracker5/widgets/filled_player_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  int currentTurn = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Turn $currentTurn',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
                  child: Text(
                      'something went wrong - PlayersLoadedState == false'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 75)),
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: currentTurn < 8
                    ? () {
                        setState(() {
                          currentTurn++;
                        });
                        final bloc = context.read<PlayersBloc>();
                        bloc.add(StartNextTurn());
                      }
                    : null,
                child: currentTurn < 8
                    ? Text(
                        'next turn',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )
                    : Text(
                        'Game is over!',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
