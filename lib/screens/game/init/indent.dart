import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class indent extends StatefulWidget {
  const indent({super.key,required this.curPages});
  final int curPages;
  @override
  State<indent> createState() => _indentState();
}

class _indentState extends State<indent> {
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        dotsCount: 3,
        position: widget.curPages,
        decorator: DotsDecorator(
          color: Colors.black38, // Inactive color
          activeColor: Colors.blue,
        ),
    );
  }
}

