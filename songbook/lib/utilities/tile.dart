import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tile extends StatefulWidget {
  final String songName;
  final String singerName;
  final int index;
  final void Function(int) delete;
  Tile(
      {super.key,
      required this.songName,
      required this.singerName,
      required this.index,
      required this.delete});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FractionallySizedBox(
        widthFactor: 0.8, // 80% of the parent width
        child: Slidable(
          child: Container(
            padding:
                EdgeInsets.all(20), // Add some padding for better visibility
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 220, 220),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  widget.songName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    " - " + widget.singerName,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext) {
                  widget.delete(widget.index);
                },
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
