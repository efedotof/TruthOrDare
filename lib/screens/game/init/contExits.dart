import 'package:flutter/material.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';

class ExitsCont extends StatefulWidget {
  const ExitsCont({super.key});

  @override
  State<ExitsCont> createState() => _ExitsContState();
}

class _ExitsContState extends State<ExitsCont> {
  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(child: GestureDetector(onTap: () {
            Home.of(context)?.exits();
          },)),
          Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(onPressed: (){
                        Home.of(context)?.exits_app();

                      }, child: const Text('Выйти')),
                       OutlinedButton(onPressed: (){
                        Home.of(context)?.exits();
                       }, child: const Text('Отмена')),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}