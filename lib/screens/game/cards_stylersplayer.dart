




import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget cards_player(context,name, player_number){
  // ignore: sized_box_for_whitespace
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width - 40,

    child: Card(
      elevation: 1.0,
      child: Row(
        children: [
          Padding(
                padding:EdgeInsets.all(4.0),
            child: Text("№ $player_number"),
          ),
          const Padding(
                padding:EdgeInsets.all(4.0),
            child: Icon(Icons.person),
          ),
          Padding(
                padding:EdgeInsets.all(4.0),
            child: Text("$name"),
          ),
        ],
      ),
    ),
  );
}







