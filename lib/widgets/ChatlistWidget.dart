import 'package:ckpmessaging/widgets/ChatItemWidget.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget{
  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
          child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) => ChatItemWidget(index),
            itemCount: 20,
            reverse: true,
            controller: listScrollController,
          ),
    );
  }
}