import 'dart:math';

import 'package:flutter/material.dart';

// Usar o StatefulWidget quando precisar alterar o estado do widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> names = ['Daniel', 'Maria', 'João'];
  bool wasPressed = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Colors.purple[200],
      ),
      body: Container( 
        width:300,
        height: 300,
        color: Colors.purple[100],
        child: Align( //Align tem rendezirização separada
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black,
          )
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          final int randomIndex = Random().nextInt(names.length);
          wasPressed = true;
          setState(() {
            name = names[randomIndex];
          });
        },
        child: const Text('Gerar nome'),
      ),
    );
  }
}
