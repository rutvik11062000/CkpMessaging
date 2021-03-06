import 'package:ckpmessaging/pages/ConversationBottomSheet.dart';
import 'package:ckpmessaging/widgets/InputWidget.dart';
import 'package:flutter/material.dart';
import 'package:ckpmessaging/pages/ConversationPage.dart';

class ConversationPageList extends StatefulWidget {
  @override
  _ConversationPageListState createState() => _ConversationPageListState();
  const ConversationPageList();
}

class _ConversationPageListState extends State<ConversationPageList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: Column(
              children: <Widget>[
                Expanded(
                    child: PageView(
                  children: <Widget>[
                    ConversationPage(),
                    ConversationPage(),
                    ConversationPage()
                  ],
                )),
                Container(
                    child: GestureDetector(
                        child: InputWidget(),
                        onPanUpdate: (details) {
                          if (details.delta.dy < 0) {
                            _scaffoldKey.currentState
                                .showBottomSheet<Null>((BuildContext context) {
                              return ConversationBottomSheet();
                            });
                          }
                        }))
              ],
            )));
  }
}
