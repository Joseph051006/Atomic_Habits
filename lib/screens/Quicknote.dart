import 'package:flutter/material.dart';

class Quicknote extends StatefulWidget {
  const Quicknote({super.key});

  @override
  State<Quicknote> createState() => _QuicknoteState();
}

class _QuicknoteState extends State<Quicknote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Container(
        alignment: Alignment.center,
        child: Text("QuickNotes", style: TextStyle(fontFamily:'Tektur' ),),
      )),
    );
  }
}