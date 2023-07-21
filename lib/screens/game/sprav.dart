import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class sprav extends StatefulWidget {
  const sprav({super.key});

  @override
  State<sprav> createState() => _spravState();
}

class _spravState extends State<sprav> {

   void exits(){
    setState(() {
      Navigator.pop(context);
    });
    
  }



  Widget start_page(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(
      //     color:  Colors.black,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: start_page_list(context),
      ),
    );
  }
  Widget start_page_list(BuildContext context){
    return ListView(
      padding: EdgeInsets.only(left: 14, right: 14,top: 3),
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:   exits
          , icon: Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    Text("Правила".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                  
                ),
                  Text(" ".toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        AutoSizeText(
          'Игра "Правда или действие" - это игра, в которой участники получают вопросы или задания, чтобы отвечать честно или выполнить задание.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Правила игры:',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Вначале игроки определяют, кто начнет игру.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'После определения первого игрока, приложение задает вопрос другому игроку: "Правда или действие?"',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Если игрок выбирает правду, то приложение задает ему вопрос, на который он должен ответить честно.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Если игрок выбирает действие, то приложение дает ему задание.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'После выполнения задания или ответа на вопрос, роль игрока переходит к следующему игроку.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Игра продолжается, пока все игроки не согласятся выйти или не закончатся вопросы или задания.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Примерные вопросы:',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Какой самый глупый поступок, который ты когда-либо совершал?',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Какой был твой худший опыт свидания?',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Какую самую странную вещь ты когда-либо ел?',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Примеры заданий:',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Сделай голосовой пост, в котором ты поешь про любовь на французском языке и отправь его своей бывшей подруге.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Выйди на улицу и попроси у прохожих оценку твоей прически.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
        AutoSizeText(
          'Сходи в ближайший магазин и попроси у продавца продать тебе самый дорогой товар за 5 долларов.',
          
          style: TextStyle(fontSize: 17,color: Colors.black54),
          maxLines: 90,
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return start_page(context);
  }
}