
import 'dart:math' as math;
import 'dart:ui';
import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pravda_or_deistvie/screens/game/gamedata/list.dart';
import 'package:pravda_or_deistvie/screens/game/init/pushError.dart';
import 'package:pravda_or_deistvie/screens/game/sprav.dart';
import 'package:pravda_or_deistvie/screens/game/card_pages.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';

import 'style/cards_stylersplayer.dart';

class page1_2 extends StatefulWidget {
  const page1_2({super.key,
    required this.array_vopros,
    required this.array_vopros_destvie,
  });
  final List<String> array_vopros;
  final List<String> array_vopros_destvie;


  @override
  State<page1_2> createState() => _page1_2State();
}

class _page1_2State extends State<page1_2> with TickerProviderStateMixin {
  final CardSwiperController controller = CardSwiperController();
  final TextEditingController controller_text = TextEditingController();
  math.Random random = new math.Random();
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

  var array_deistvie = [""];
  var name = 'Перед началом посмотрите правила';
  String swiper_cards = "";
  String vopros = "Правда или Действие ?";
  bool init_player = true;
  int count = 0;
  int isencition = 0;
  var list = [];
  var list2 = [];


  List array_card_listener = [];
  int player_numbers = 1;
  String name_player = "";
  String player_number = "Тест Работы";
  int crug = 0;
  var player_naming_start_game = [];

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
     });
    return true;
  }


  void rigth_state() async{
     setState(() {
      if(crug < 2){
        crug += 1;
      }else{
        if(isencition !=  widget.array_vopros_destvie.length){
          state_0();
          // rand_numbers2();
          int cacheStat = list2[isencition];
          cards.clear();
          count += 1;
          cards.add(cards_widgets(player:player_number,name: widget.array_vopros_destvie[cacheStat],));
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
        if(isencition !=  widget.array_vopros.length){
        cards.clear();
        // rand_numbers();
        int cacheStat = list[isencition];
        count += 1;
        cards.add(cards_widgets(player: player_number,name: widget.array_vopros[cacheStat],));
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
      if(player_naming_start_game.length == 3){
        if(count % 3 == 0){
        player_number = player_naming_start_game[0] ;
        }
        if(count % 3 == 1){
          player_number = player_naming_start_game[1];
        }
        if(count % 3 == 2){
          player_number = player_naming_start_game[2];
        }
      }
      if(player_naming_start_game.length == 4){
        if(count % 4 == 0){
        player_number = player_naming_start_game[0];
        }
        if(count % 4 == 1){
          player_number = player_naming_start_game[1];
        }
        if(count % 4 == 2){
          player_number = player_naming_start_game[2];
        }
        if(count % 4 == 3){
          player_number = player_naming_start_game[3];
        }
      }
      if(player_naming_start_game.length == 5){
        if(count % 5 == 0){
        player_number = player_naming_start_game[0];
        }
        if(count % 5 == 1){
          player_number = player_naming_start_game[1];
        }
        if(count % 5 == 2){
          player_number = player_naming_start_game[2];
        }
        if(count % 5 == 3){
          player_number = player_naming_start_game[3];
        }
        if(count % 5 == 4){
          player_number = player_naming_start_game[4];
        }
      }
      
      
    });
   
  }

  void exits(){
    setState(() {
      Navigator.pop(context);
    });
    
  }

  Widget state_player(name){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed:   exits
, icon: const Icon(Icons.arrow_back_ios)),
              Column(
                children: [
                  Text("Для Компании".toUpperCase(),style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ],
                
              ),
               IconButton(onPressed: spravs, icon: const Icon(Icons.book)),
            ],
          ),
        
          for (int i = 0; i < array_card_listener.length;i++)array_card_listener[i],
          SizedBox(
            height: MediaQuery.of(context).size.height/4,
          ),
          Align(alignment: Alignment.bottomCenter,
          child:OutlinedButton(onPressed: (){
            setState(() {
              _displey_text_dialog(context);
            });
          },style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,), child: SizedBox(width: MediaQuery.of(context).size.width-20,child:const Center(child: Text("Добавить")))
          ),
          ),
          if(player_numbers > 3) Align(alignment: Alignment.bottomCenter,
          child:OutlinedButton(onPressed: (){setState(() {
            init_player = false;
          });}, style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,),child: SizedBox(width: MediaQuery.of(context).size.width-20,child: const Center(child:Text("Начать игру")))
          ),
          ),
        ],
      ),
    );
  }

  


  void adds(){
    setState(() {
      if(player_numbers > 5){
      Message.show(context, message: 'Превышен лимит пользователей');
     }else{
      _displey_text_dialog(context);
      player_naming_start_game.add(name_player);
            array_card_listener.add(cards_player(
              name:
            "$name_player",
            player_number: player_numbers));
            player_numbers += 1;
    }
    });
  }


  Future <void> _displey_text_dialog(BuildContext context){
    return showDialog(context: context, builder:
      (context){
        return AlertDialog(title: Text("Введите имя для игрока"),
          content: TextField(onChanged: (value){
              setState(() {
                name_player = value;
              });
          },
          controller: controller_text,
          decoration: InputDecoration(hintText: "Введите имя"),
          ),
        actions: [
          TextButton(
                onPressed: () {
                  if(name_player != ''){
                    adds();
                  Navigator.of(context).pop();
                  }else{
                    Message.show(context, message: 'Имя пользователя не введено');
                  }
                },
                child: Text('Готово'),
              )
        ],
        );
      }
    );
  }


  void rand_numbers (){
    var listim = List.generate(widget.array_vopros_destvie.length, (int i) => i);                                                                                     
    listim.shuffle();       
    for(int i = 0; i < listim.length;i++){
      list2.add(listim[i]);
    }                    
  }
  void rand_numbers2 (){
    var listim = List.generate(widget.array_vopros.length, (int i) => i);                                                                                     
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

  
  List cards =[cards_widgets(player: "Информация",name: "Добро пожаловать !",),cards_widgets(player: "Информация",name: "Перед началом посмотрите правила",),cards_widgets(player: "Тест Работы",name: "Правда или Действие ?",)];

  @override
  void initState() {
    super.initState();
    rand_numbers();
    rand_numbers2();
  }



  Widget start_page_view(BuildContext context){
    return AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(options: particles),
      child: Padding(
      padding: const EdgeInsets.only(top: 35, left: 8, right: 8),
      child:init_player ? state_player(context,): Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: back_arr, icon:const Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    Text("Легко".toUpperCase(),style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                  
                ),
                 IconButton(onPressed: spravs, icon: const Icon(Icons.book)),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top:40),
                child: AutoSizeText(
              "Влево - Правда",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color: Colors.black54),
              maxLines: 9,
            ),
            ),
            const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                    crug ++;
                  });
                }
                ,style: OutlinedButton.styleFrom(
                 backgroundColor: Colors.white,
                side:const BorderSide(width: 1.0, color: Colors.black),
              ), child:const  Text("Готово",style: TextStyle(color: Colors.black45, fontSize: 17),),
          ),
        ),
      ),
    
          ],
        ),
      ),
      )
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
