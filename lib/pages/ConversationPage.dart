import 'package:ckpmessaging/widgets/ChatAppBar.dart';
import 'package:ckpmessaging/widgets/ChatlistWidget.dart';
import 'package:ckpmessaging/widgets/InputWidget.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  

  @override
  _ConversationPageState createState() => _ConversationPageState();
  const ConversationPage();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ChatAppBar(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ChatListWidget(),
              InputWidget(),
            ],
          )
        ],
      ),
    ));
  }
}