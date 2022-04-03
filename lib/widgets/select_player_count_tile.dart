import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/pages/players_setup_page.dart';

class SelectPlayerCountTile extends StatelessWidget {
  SelectPlayerCountTile(this.playerCount, this.heroTag);

  final String playerCount;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFFeb1555),
      heroTag: heroTag,
      shape: RoundedRectangleBorder(),
      child: Text(
        playerCount,
        style: TextStyle(
          fontSize: 30,
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
