import 'package:eclipse_turn_order_tracker5/pages/home_page.dart';
import 'package:eclipse_turn_order_tracker5/players_bloc/players_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayersBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'turn order tracker',
        home: HomePage(),
      ),
    );
  }
}
