
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pravda_or_deistvie/screens/game/sprav.dart';
import 'package:pravda_or_deistvie/screens/game/list.dart';
import 'package:pravda_or_deistvie/screens/game/card_pages.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';


class page3_1 extends StatefulWidget {
  const page3_1({super.key});

  @override
  State<page3_1> createState() => _page3_1State();
}

class _page3_1State extends State<page3_1> {
  final CardSwiperController controller = CardSwiperController();
  
  math.Random random = new math.Random();
  var array_deistvie = [""];
  var name = 'Перед началом посмотрите правила';
  String swiper_cards = "";
  String vopros = "Правда или Действие ?";
  int isencition = 0;
  var list = [];
  var list2 = [];
  
  int count = 0;


 
  String player_number = "Игрок 1";
  int crug = 0;



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
     name = direction.toString().split('.').last;
     setState(() {
       
       if(name == "left"){
          left_state();
        }
     
        if(name == "right"){
          rigth_state();
         
        }
        if(name == "top"){
                
          
        }
        if(name == "bottom"){
         
          
        }
     
     
     
     });
    
    
    return true;
  }

    void rigth_state() async{
     setState(() {
      if(crug < 2){
        crug += 1;
      }else{
        if(isencition != array_vopros_destvie3_1.length){
          state_0();
          // rand_numbers2();
          int cacheStat = list2[isencition];
          cards.clear();
          count += 1;
          cards.add(cards_widgets(player:player_number,name:array_vopros_destvie3_1[cacheStat],));
          state_0();
          cards.add(cards_widgets(player: player_number,name: "Правда или Действие ?",));
          isencition++;
        }else{
          isencition = 0;
        }
        
        }
     });
  }

  void left_state(){
    setState(() {
      if(crug < 2){
        crug += 1;
      }else{
        if(isencition != array_vopros3_1.length){
        cards.clear();
        // rand_numbers();
        int cacheStat = list[isencition];
        count += 1;
        cards.add(cards_widgets(player: player_number,name: array_vopros3_1[cacheStat],));
        state_0();
        cards.add(cards_widgets(player: player_number,name: "Правда или Действие ?",));
        isencition++;
      }else{
        isencition = 0;
      }
      }
    });
  }



  void state_0(){
    setState(() {
       if(count % 2 == 0){
        player_number = "Игрок 1";
      }else{
        player_number = "Игрок 2";
      }
    });
   
  }
  @override
  void initState() {
    super.initState();
    rand_numbers();
    rand_numbers2();
  }

   void rand_numbers (){
    var listim = List.generate(array_vopros_destvie3_1.length, (int i) => i);                                                                                     
    listim.shuffle();       
    for(int i = 0; i < listim.length;i++){
      list2.add(listim[i]);
    }                    
  }
  void rand_numbers2 (){
    var listim = List.generate(array_vopros3_1.length, (int i) => i);                                                                                     
    listim.shuffle();       
    for(int i =0; i < listim.length;i++){
      list.add(listim[i]);
    }                          
  }


  void spravs(){
    setState(() {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => sprav()),);
      });
  }

  void back_arr(){
    setState(() {
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),);
    });
  }

  
  List cards =[cards_widgets(player: "Информация",name: "Добро пожаловать !",),cards_widgets(player: "Информация",name: "Перед началом посмотрите правила",),cards_widgets(player: "Игрок 1",name: "Правда или Действие ?",)];




  Widget start_page_view(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 8, right: 8),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: back_arr, icon: Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    Text("Сложно".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                  
                ),
                 IconButton(onPressed: spravs, icon: Icon(Icons.book)),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top:40),
                child: AutoSizeText(
              "Влево - Правда",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color: Colors.black54),
              maxLines: 9,
            ),
            ),
            Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: AutoSizeText(
                "Вправо - Действие,",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,color: Colors.black54),
                maxLines: 9,
              ),  
            ),

           
         Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                
                onSwipe: _onSwipe,
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (context, index) => cards[index],
              ),
            ),
        
          Padding(
              padding: const EdgeInsets.only(top:50),
              child: Container(
                width: 300,
                height: 100,
                child: OutlinedButton(onPressed:   (){
                  controller.swipeTop();
                  setState(() {
                    crug++;
                  });
                }
      ,style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.black),
              ), child:  Text("Готово",style: TextStyle(color: Colors.black45, fontSize: 17),),
          ),
        ),
      ),
    
          ],
        ),
      ),
    );
  }
  Widget start_page(BuildContext context){
    return Scaffold(
      body:start_page_view(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return start_page(context);
  }
}





 







  
