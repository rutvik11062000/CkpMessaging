import 'package:ckpmessaging/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('ChatListWidget UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byType(ListView),findsOneWidget);
  });
}