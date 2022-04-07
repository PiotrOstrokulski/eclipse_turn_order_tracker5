import 'package:eclipse_turn_order_tracker5/models/player.dart';
import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:eclipse_turn_order_tracker5/pages/tracker_page.dart';
import 'package:eclipse_turn_order_tracker5/widgets/blank_player_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/constants.dart';

class PlayersSetupPage extends StatefulWidget {
  final String playerCount;
  PlayersSetupPage(this.playerCount);

  @override
  State<PlayersSetupPage> createState() => _PlayersSetupPageState();
}

class _PlayersSetupPageState extends State<PlayersSetupPage> {
  List<BlankPlayerTile> playerTiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Input players'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: int.parse(widget.playerCount),
              itemBuilder: (context, index) {
                BlankPlayerTile currentPlayerTile = BlankPlayerTile();
                playerTiles.add(currentPlayerTile);
                return currentPlayerTile;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadiusValue),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFF1B161)),
              ),
              onPressed: () {
                final bloc = context.read<PlayersBloc>();
                List<Player> playersList = List<Player>.empty(
                  growable: true,
                );
                for (int i = 0; i < playerTiles.length; i++) {
                  Player player = Player(
                    name: playerTiles[i].playerNameController.text,
                    color: playerTiles[i].color!,
                    currentTurnOrderPosition: i + 1,
                  );
                  playersList.add(player);
                }
                bloc.add(InitializePlayers(playersList));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackerPage(),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
