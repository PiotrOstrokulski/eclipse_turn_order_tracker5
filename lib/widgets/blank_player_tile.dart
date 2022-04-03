import 'package:flutter/material.dart';

class BlankPlayerTile extends StatefulWidget {
  BlankPlayerTile({Key? key}) : super(key: key);
  TextEditingController playerNameController = TextEditingController();

  Color color = Color(0xFFeb1555);

  @override
  State<BlankPlayerTile> createState() => _BlankPlayerTileState();
}

class _BlankPlayerTileState extends State<BlankPlayerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: widget.color,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.playerNameController,
              ),
            ),
            IconButton(
              onPressed: () {
                showBottomSheet(
                  constraints: BoxConstraints(maxHeight: 100),
                  context: context,
                  builder: (context) => Container(
                    height: 400,
                    color: Color(0xFF17264C),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.red;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.yellow,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.yellow;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.green,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.green;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.blue;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.white;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.black;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.format_paint),
            ),
          ],
        ),
      ),
    );
  }
}
