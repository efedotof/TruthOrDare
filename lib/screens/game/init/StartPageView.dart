
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';
import 'package:pravda_or_deistvie/screens/game/init/contExits.dart';
import 'package:pravda_or_deistvie/screens/game/init/screen_lover.dart';
import 'package:pravda_or_deistvie/screens/game/init/spravInit.dart';

class start_page_view extends StatefulWidget {
  const start_page_view({super.key,
  required this.curPages,
  required this.controller,
  required this.click1_1,
  required this.click1_2,
  required this.click2_1,
  required this.click2_2,
  required this.click3_1,
  required this.click3_2,
  required this.exits,
  required this.sprav_init,
  });

  final Function() click1_1;
  final Function() click1_2;
  final bool exits;
  final bool sprav_init;
  final Function() click2_1;

  final Function() click2_2;

  final Function() click3_1;

  final Function() click3_2;




  final PageController controller;
  final int curPages;

  @override
  State<start_page_view> createState() => _start_page_viewState();
}

class _start_page_viewState extends State<start_page_view> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            PageView(
          controller: widget.controller,
          children: [
           screens_lover(name:"Легко",
           text:"Приятно провести время с друзьями или близкими, не переживая о неприятных последствиях отвеченных вопросов или выполненных заданий. Этот режим ориентирован на более мягкие и безобидные вопросы и задания, которые не вызовут сильный дискомфорт у участников игры",
           image:"lib/assets/sqrt2.png",
           clickOne:widget.click1_1,
           clickTwo:widget.click1_2,
           size_int1:35,
           size_int2:1,
           curPages: widget.curPages,
           ),
           screens_lover(name:"Средняя",
           text:"Игроки испытывают свою удачу и смелость, выбирая между тем, чтобы отвечать на острые вопросы или выполнять непредсказуемые задания. Режим охватывает среднюю сложность, где вопросы и задания уже не так просты, чтобы ответить на них или выполнить их без труда, но и не настолько трудны, чтобы вызывать крайнее напряжение и страх участников.",
           image:"lib/assets/sqrt3.png",
           clickOne:widget.click2_1,
           clickTwo:widget.click2_2,
           size_int1:19,
           size_int2:10,
           curPages: widget.curPages,
           ),
           screens_lover(name: "Сложно 18+",
      text:"Уникальная возможность проверить свою смелость и честность. В этом режиме игроки должны выполнять самые сложные задания или отвечать на неприятные вопросы, которые помогут им раскрыть свои настоящие мысли и чувства.",
           image:"lib/assets/sqrt1.png",
           clickOne:widget.click3_1,
           clickTwo:widget.click3_2,
           size_int1:40,
           size_int2:1,
           curPages: widget.curPages,
           ),
          ],
        
        ),
        if (widget.exits) ExitsCont(),
        if (widget.sprav_init) Spravint(),
      
          ],
        ),
      ),
    );
  }
}