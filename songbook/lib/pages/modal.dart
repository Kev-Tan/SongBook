import 'package:flutter/material.dart';

class ModalPage extends StatelessWidget {
  final songController;
  final singerController;
  VoidCallback addSong;
  ModalPage(
      {super.key,
      required this.songController,
      required this.addSong,
      required this.singerController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new songs"),
      content: Container(
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: songController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add song',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextField(
                controller: singerController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Singer',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: 200,
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel")),
                    Spacer(),
                    ElevatedButton(onPressed: addSong, child: Text("Add")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
