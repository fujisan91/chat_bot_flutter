import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class AppStyles {
  
  static TextStyle textStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
  );

  // APIから返されたメッセージを表示する吹き出し
  static BubbleStyle styleAISide = BubbleStyle(
    nip: BubbleNip.leftTop,
    color: Colors.white,
    margin: BubbleEdges.only(left: 3.0, top: 8.0, right: 50.0),
    alignment: Alignment.topLeft,
  );

  // 打ち込んだメッセージを表示する吹き出し
  static BubbleStyle styleMySide = BubbleStyle(
    nip: BubbleNip.rightTop,
    color: Color.fromARGB(255, 225, 255, 199),
    margin: BubbleEdges.only(left: 50.0, top: 8.0, right: 3.0),
    alignment: Alignment.topRight,
  );
}