import 'package:bubble/bubble.dart';
import 'package:chatbot/configs/appStyles.dart';
import 'package:chatbot/helper/apiHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 状態を保持できるwidget
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 画面に表示する吹き出しのリスト
  List<Bubble> _messages = [];
  // textfieldに入力された値を操作するコントローラー
  TextEditingController _textController = TextEditingController();

  // 初期表示画面
  @override
  void initState() {
    super.initState();

    // 初期表示時はAIからの吹き出しのみ表示する
    _messages.add(
      Bubble(
        style: AppStyles.styleAISide,
        child: Text('何について聞きたいですか？', style: AppStyles.textStyle),
      )
    );
  }

  // 送信ボタン押下時
  void clickSubmid(String inputText) {
    // textfieldに何も入力されていなければ送信ボタン押下時に何もしない
    if (inputText.isEmpty || inputText == null) {return;}

    // 画面を更新する
    setState(() {
      _messages.add(
          Bubble(
            style: AppStyles.styleMySide,
            child: Text(inputText, style: AppStyles.textStyle),
          )
      );
    });
    // textfieldを初期化する
    _textController.clear();

    // API呼び出し、レスポンスを受け取り画面を更新する
    ApiHelper.requestNoby(inputText).then((value) => {
      setState(() {
        _messages.add(
          Bubble(
            style: AppStyles.styleAISide,
            child: Text(value.nobyMessage, style: AppStyles.textStyle),
          )
        );
        FocusScope.of(context).requestFocus(FocusNode());
      })
    }).catchError((e) => {
      print(e)
    });
  }

  // 画面を構成するwidget群を生成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: _messages == null ? 0 : _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _messages[index];
                  }
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: TextField(
                      autofocus: false,
                      style: AppStyles.textStyle,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'テキストを入力してください。',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RaisedButton(
                      child: Text('送信'),
                      color: Colors.blue,
                      shape: StadiumBorder(),
                      onPressed: () {
                        clickSubmid(_textController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}