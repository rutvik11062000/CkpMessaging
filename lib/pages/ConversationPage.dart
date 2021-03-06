import 'package:ckpmessaging/config/Assets.dart';
import 'package:ckpmessaging/config/Palette.dart';
import 'package:ckpmessaging/config/Styles.dart';
import 'package:ckpmessaging/widgets/ChatAppBar.dart';
import 'package:ckpmessaging/widgets/ChatlistWidget.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();

  const ConversationPage();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(flex: 2, child: ChatAppBar()), // Custom app bar for chat screen
      Expanded(
          flex: 11,
          child: Container(
            color: Colors.blueGrey,
            child: ChatListWidget(),
          ))
    ]);
  }
}

