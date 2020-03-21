import 'package:flutter/material.dart';
import 'package:ckpmessaging/pages/ConversationPage.dart';

class ConversationPageList extends StatefulWidget {
  

  @override
  _ConversationPageListState createState() => _ConversationPageListState();
  const ConversationPageList();
}

class _ConversationPageListState extends State<ConversationPageList> {
  final cotroller  = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: cotroller,
      children: <Widget>[
        ConversationPage(),
        ConversationPage(),
        ConversationPage(),

      ],
    );
  }
}