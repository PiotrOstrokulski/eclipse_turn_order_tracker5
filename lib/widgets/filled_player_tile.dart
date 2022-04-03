import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/models/player.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FilledPlayerTile extends StatelessWidget {
  Player player;
  FilledPlayerTile(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: player.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              player.name,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.green, width: 4),
              ),
              child: TextButton(
                child: Text(
                  player.isPassed ? 'unpass' : 'pass',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  final bloc = context.read<PlayersBloc>();
                  bloc.add(SwitchPlayerPass(player.name));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
