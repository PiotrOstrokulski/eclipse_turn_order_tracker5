import 'package:eclipse_turn_order_tracker5/models/constants.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BlankPlayerTile extends StatefulWidget {
  BlankPlayerTile({Key? key}) : super(key: key);
  TextEditingController playerNameController = TextEditingController();

  Color? color = Color(0xFF42A5F5);

  @override
  State<BlankPlayerTile> createState() => _BlankPlayerTileState();
}

class _BlankPlayerTileState extends State<BlankPlayerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(kBorderRadiusValue),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: TextField(
                  maxLength: 12,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'input player name',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  controller: widget.playerNameController,
                ),
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
                            color: Colors.red[700],
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.red[700];
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.yellow[700],
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.yellow[700];
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.green[700],
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.green[700];
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.blue[700],
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.blue[700];
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.grey[400],
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Colors.grey[400];
                            });
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFF232323),
                          ),
                          onTap: () {
                            setState(() {
                              widget.color = Color(0xFF232323);
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
