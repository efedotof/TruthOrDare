import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class cards_widgets extends StatelessWidget {
  final player;
  final name;
  cards_widgets({required this.name, required this.player});
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width-20,
            height:400,
            decoration: BoxDecoration(
              color: Colors.white,
                  border: Border.all(
                      color: Colors.black,
                      width: 2,
                  ),
                
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: AutoSizeText(
                  player,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16,color: Colors.black54),
                  maxLines: 9,
                ),
                ),
                AutoSizeText(
                name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16,color: Colors.black54),
                  maxLines: 9,
                ),
                const AutoSizeText(
                  " ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,color: Colors.black54),
                  maxLines: 9,
                ),
              ],
            ),  
          

    );
  }
}