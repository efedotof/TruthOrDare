




import 'package:flutter/material.dart';


class cards_player extends StatefulWidget {
  const cards_player({super.key,
    required this.name, 
    required this.player_number,
  });
    final String name;
    final int player_number;



  @override
  State<cards_player> createState() => _cards_playerState();
}

class _cards_playerState extends State<cards_player> {
  @override
  Widget build(BuildContext context) {
     return Container(
    height: 60,
    width: MediaQuery.of(context).size.width - 40,

    child: Card(
      elevation: 1.0,
      child: Row(
        children: [
          Padding(
                padding:EdgeInsets.all(4.0),
            child: Text("№ ${widget.player_number}"),
          ),
          const Padding(
                padding:EdgeInsets.all(4.0),
            child: Icon(Icons.person),
          ),
          Padding(
                padding:EdgeInsets.all(4.0),
            child: Text("${widget.name}"),
          ),
        ],
      ),
    ),
  );
  }
}






