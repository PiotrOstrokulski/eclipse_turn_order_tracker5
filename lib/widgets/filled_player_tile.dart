import 'package:eclipse_turn_order_tracker5/models/constants.dart';
import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/models/player.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FilledPlayerTile extends StatelessWidget {
  Player player;
  FilledPlayerTile(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          color: player.color,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                player.name,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(kBorderRadiusValue),
                ),
                color: Colors.grey[800],
                border: Border.all(color: Color(0xFF212121), width: 2),
              ),
              child: TextButton(
                child: Text(
                  player.isPassed ? 'unpass' : 'pass',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
