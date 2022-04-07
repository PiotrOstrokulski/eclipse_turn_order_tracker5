import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/widgets/select_player_count_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: const Text(
          'Select player count',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: List.generate(
            6,
            (index) => SelectPlayerCountTile(
              (index + 1).toString(),
              'btn${index + 1}',
            ),
          ),
        ),
      ),
    );
  }
}
