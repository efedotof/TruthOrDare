
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:pravda_or_deistvie/screens/game/sprav.dart';
import 'package:pravda_or_deistvie/screens/game/page1_1.dart';
import 'package:pravda_or_deistvie/screens/game/page1_2.dart';
import 'package:pravda_or_deistvie/screens/game/page2_1.dart';
import 'package:pravda_or_deistvie/screens/game/page2_2.dart';
import 'package:pravda_or_deistvie/screens/game/page3_1.dart';
import 'package:pravda_or_deistvie/screens/game/page3_2.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static dynamic currentPageValue = 0.0;
  int curPages = currentPageValue.toInt();
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
       controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        curPages = currentPageValue.toInt();
      });
    });
  }
  // Future <void> showInterstitialAd() async{
  //   final ad = await InterstitialAd.create(adUnitId: 'demo-interstitial-yandex',
  //   onAdLoaded: (){},
  //   onAdFailedToLoad: (error){},
  //   );
  //   await ad.load(adRequest: AdRequest());
  //   await ad.show();
  //   await ad.waitForDismiss();

  // }



  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Оповещение'),
            content: Text('Вы действительно хотите выйти ?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text('Да')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Нет'),
              )
            ],
          );
        });
  }

  Widget indent(BuildContext context){
    return DotsIndicator(
        dotsCount: 3,
        position: curPages,
        decorator: DotsDecorator(
          color: Colors.black38, // Inactive color
          activeColor: Colors.blue,
        ),
    );
       
     

  }



  void click1_1(){
    // showInterstitialAd();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_1()),),);
  }
  void click1_2(){
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_2()),),);
  }
  void click2_1(){
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page2_1()),),);
  }
  void click2_2(){
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page2_2()),),);
  } 
  void click3_1(){
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page3_1()),),);
  }
  void click3_2(){
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page3_2()),),);
  } 

  void exits(){
    setState(() {
      _showMaterialDialog();
    });
    
  }
  void spravs(){
    setState(() {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => sprav()),);
      });
  }

  

  Widget start_page_view(BuildContext context){
    return PageView(
      controller: controller,
      
      children: [
       screens_lover("Легко",
       "Приятно провести время с друзьями или близкими, не переживая о неприятных последствиях отвеченных вопросов или выполненных заданий. Этот режим ориентирован на более мягкие и безобидные вопросы и задания, которые не вызовут сильный дискомфорт у участников игры ",
       "lib/assets/sqrt2.png",
       click1_1,
       click1_2,
       35,
       1,
       ),
       screens_lover("Средняя",
       "Игроки испытывают свою удачу и смелость, выбирая между тем, чтобы отвечать на острые вопросы или выполнять непредсказуемые задания. Режим охватывает среднюю сложность, где вопросы и задания уже не так просты, чтобы ответить на них или выполнить их без труда, но и не настолько трудны, чтобы вызывать крайнее напряжение и страх участников.",
       "lib/assets/sqrt3.png",
       click2_1,
       click2_2,
       19,
       10,
       ),
       screens_lover("Сложно 18+",
       "Уникальная возможность проверить свою смелость и честность. В этом режиме игроки должны выполнять самые сложные задания или отвечать на неприятные вопросы, которые помогут им раскрыть свои настоящие мысли и чувства.",
       "lib/assets/sqrt1.png",
       click3_1,
       click3_2,
       40,
       1,
       ),
      ],
    
    );
  }
  Widget start_page(BuildContext context){
    return Scaffold(
      body:start_page_view(context),
    );
  }

  Widget screens_lover(name, text, image, click_one, click_two, size_int1, size_int2){
    return Container(
      padding: EdgeInsets.only(top: 35,left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed:   exits
, icon: Icon(Icons.arrow_back_ios)),
              Column(
                children: [
                  Text("$name".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ],
                
              ),
               IconButton(onPressed: spravs, icon: Icon(Icons.book)),
            ],
          ),
          Image.asset("$image",width: 128,
      height:128,
      ),
  Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: AutoSizeText(
  "$text",
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
          child: OutlinedButton(onPressed: click_one,style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.black),
        ), child: Column(
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
        child: Container(
          width: 300,
          height: 125,
          child: OutlinedButton(onPressed: click_two,style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.black),
        ), child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Для Компании:",style: TextStyle(color: Colors.black45, fontSize: 17),),
              Text("Начать",style: TextStyle(decoration: TextDecoration.underline,color: Colors.black45, fontSize: 15),),
              Text("Случайная генерация",style: TextStyle(color: Colors.black45, fontSize: 13),),
            ],
          ), ),
        ),
      ),
            
           SizedBox(height:size_int1.toDouble(),),
           indent(context),  
           SizedBox(height:size_int1.toDouble(),),
             
             


        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return start_page(context);
  }
}