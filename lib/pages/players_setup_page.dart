import 'package:eclipse_turn_order_tracker5/models/player.dart';
import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:eclipse_turn_order_tracker5/pages/tracker_page.dart';
import 'package:eclipse_turn_order_tracker5/widgets/blank_player_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersSetupPage extends StatefulWidget {
  final String playerCount2;
  PlayersSetupPage(this.playerCount2);

  @override
  State<PlayersSetupPage> createState() => _PlayersSetupPageState();
}

class _PlayersSetupPageState extends State<PlayersSetupPage> {
  List<BlankPlayerTile> playerTiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('players_setup_page'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: int.parse(widget.playerCount2),
                itemBuilder: (context, index) {
                  BlankPlayerTile currentPlayerTile = BlankPlayerTile();
                  playerTiles.add(currentPlayerTile);
                  return currentPlayerTile;
                },
              ),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                final bloc = context.read<PlayersBloc>();
                List<Player> playersList = [];
                for (int i = 0; i < playerTiles.length; i++) {
                  Player player = Player(
                    name: playerTiles[i].playerNameController.text,
                    color: playerTiles[i].color,
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
              icon: Icon(Icons.arrow_forward_outlined),
            ),
          ],
        ));
  }
}
