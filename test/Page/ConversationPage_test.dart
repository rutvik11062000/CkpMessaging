
import 'package:ckpmessaging/pages/ConversationPage.dart';
import 'package:ckpmessaging/widgets/ChatAppBar.dart';
import 'package:ckpmessaging/widgets/ChatlistWidget.dart';
import 'package:ckpmessaging/widgets/InputWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
 const MaterialApp app = MaterialApp(
   home: Scaffold(
     body: const ConversationPage()
   ),
 );

 testWidgets('ConversationPage UI Test', (WidgetTester tester) async {
   // Build our app and trigger a frame.
   await tester.pumpWidget(app);

   expect(find.byType(ChatAppBar),findsOneWidget);
   expect(find.byType(InputWidget), findsOneWidget);
   expect(find.byType(ChatListWidget),findsOneWidget);


 });
}