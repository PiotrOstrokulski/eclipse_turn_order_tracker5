import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/pages/players_setup_page.dart';
import 'package:eclipse_turn_order_tracker5/models/constants.dart';

class SelectPlayerCountTile extends StatelessWidget {
  SelectPlayerCountTile(this.playerCount, this.heroTag);

  final String playerCount;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.blue[400],
      heroTag: heroTag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadiusValue),
        ),
      ),
      child: Text(
        playerCount,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayersSetupPage(playerCount),
          ),
        );
      },
    );
  }
}
