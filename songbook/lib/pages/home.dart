import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songbook/pages/modal.dart';
import 'package:songbook/utilities/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final _nameController = TextEditingController();
  final _singerController = TextEditingController();

  var songList = [];
  var singerList = [];

  void add() {
    Navigator.pop(context);
    print(_nameController.text);
    setState(() {
      songList.add(_nameController.text);
      singerList.add(_singerController.text);
    });
    _nameController.clear();
    _singerController.clear();
  }

  void remove(int index) {
    print("Delete!");
    print(index);
    setState(() {
      songList.removeAt(index);
      singerList.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              // Center the red container horizontally
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Text(
                      "Song Book",
                      style: GoogleFonts.inter(
                          fontSize: 44, fontWeight: FontWeight.w800),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ModalPage(
                                  songController: _nameController,
                                  singerController: _singerController,
                                  addSong: add,
                                );
                              },
                            ),
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        )),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20.0),
                    //   child: ElevatedButton(
                    //       onPressed: () => print(songList),
                    //       child: Text(
                    //         "-",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStateProperty.all(Colors.black),
                    //       )),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: songList.length,
                    itemBuilder: (BuildContext, index) {
                      return Tile(
                        index: index,
                        songName: songList[index],
                        singerName: singerList[index],
                        delete: (int index) => remove(index),
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 253, 245, 245),
    );
  }
}
