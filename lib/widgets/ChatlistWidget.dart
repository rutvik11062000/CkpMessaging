import 'package:ckpmessaging/widgets/ChatItemWidget.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => ChatItemWidget(index),
        reverse: true,
          controller: listScrollController,
      ),
    );
  }
}