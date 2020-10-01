import 'package:chatbot/view/homeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// テーマやルーティングの設定
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBot_Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

// 状態を持たないwidget
// 画面を表示させてるheaderやbody部分
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Center(
        child: HomeView(),
      ),
    );
  }
}