

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';
import 'package:animated_background/animated_background.dart';
import 'indent.dart';

class screens_lover extends StatefulWidget {
  const screens_lover({super.key,
  required this.text, 
  required this.name, 
  required this.image, 
  required this.clickOne,
  required this.curPages,
  required this.clickTwo,
  required this.size_int1,
  required this.size_int2
  
  });
  final String text;
  final String name;
  final String image;
  final int curPages;
  final Function() clickOne;
  final Function() clickTwo;
  final double size_int1;
  final double size_int2;

  @override
  State<screens_lover> createState() => _screens_loverState();
}

class _screens_loverState extends State<screens_lover>  with TickerProviderStateMixin{
  ParticleOptions particles = const ParticleOptions(
        baseColor: Colors.blueAccent,
        spawnOpacity: 0.0,
        opacityChangeRate: 0.1,
        minOpacity: 0.9,
        maxOpacity: 0.9,
        particleCount: 70,
        spawnMaxRadius: 15.0,
        spawnMaxSpeed: 100.0,
        spawnMinSpeed: 30,
        spawnMinRadius: 7.0,
      );






  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(options: particles),
      child: Container(
        color: Colors.white54,
        padding: EdgeInsets.only(top: 35,left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:   (){
                  Home.of(context)?.exits();
                }
    , icon: Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    Text("${widget.name}".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black),),
                  ],
                ),
                 IconButton(onPressed: (){
                    Home.of(context)?.spravs();
                 } , icon: Icon(Icons.book)),
              ],
            ),
            Image.asset("${widget.image}",width: 128,
        height:128,
        ),
      Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: AutoSizeText(
      "${widget.text}",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16,color: Colors.black54),
      maxLines: 9,
    ),
      ) ,
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            width: 300,
            height: 100,
            child: OutlinedButton(onPressed: widget.clickOne,style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0, color: Colors.black),
            backgroundColor: Colors.white
          ), child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Для пары:",style: TextStyle(color: Colors.black45, fontSize: 17),),
                Text("Начать",style: TextStyle(decoration: TextDecoration.underline,color: Colors.black45, fontSize: 15),),
              ],
            ), ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:50),
          child:  Container(
            width: 300,
               
            height: 125,
            child: OutlinedButton(onPressed: widget.clickTwo,style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0, color: Colors.black),
            backgroundColor: Colors.white
          ), child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text("Для Компании:",style: TextStyle(color: Colors.black45, fontSize: 17),),
               Text("Начать",style:  TextStyle(decoration: TextDecoration.underline,color: Colors.black45, fontSize: 15),),
                 Text("Случайная генерация",style: TextStyle(color: Colors.black45, fontSize: 13),),
              ],
            ), ),
          ),
        ),
            //  SizedBox(height:widget.size_int1.toDouble(),),
            //  indent(curPages: widget.curPages,),  
            //  SizedBox(height:widget.size_int1.toDouble(),),
          ],
        ),
      ),
    );
  }
}
