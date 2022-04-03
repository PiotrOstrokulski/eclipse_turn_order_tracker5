import 'package:flutter/material.dart';
import 'package:eclipse_turn_order_tracker5/widgets/select_player_count_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA70D39),
        title: Text('home_page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            SelectPlayerCountTile('1', 'btn1'),
            SelectPlayerCountTile('2', 'btn2'),
            SelectPlayerCountTile('3', 'btn3'),
            SelectPlayerCountTile('4', 'btn4'),
            SelectPlayerCountTile('5', 'btn5'),
            SelectPlayerCountTile('6', 'btn6'),
          ],
        ),
      ),
    );
  }
}
