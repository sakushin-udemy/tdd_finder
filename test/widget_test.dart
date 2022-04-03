// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finder/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // ここまで撮影
    expect(find.byKey(ValueKey('counter')), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'add'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(
        find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    expect(find.byTooltip('Increment'), findsOneWidget);
    expect(find.bySemanticsLabel('semantics'), findsOneWidget);

    expect(
        find.byWidgetPredicate((widget) => widget is Column), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Column &&
            widget.mainAxisAlignment == MainAxisAlignment.center),
        findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Column &&
            widget.mainAxisAlignment == MainAxisAlignment.start),
        findsNothing);

    expect(find.ancestor(of: find.text('add'), matching: find.byType(Center)),
        findsOneWidget);

    expect(find.descendant(of: find.byType(Center), matching: find.text('add')),
        findsOneWidget);

    expect(
        find.byElementType(SingleChildRenderObjectElement), findsNWidgets(75));

    expect(find.byElementPredicate((e) => e is SingleChildRenderObjectElement),
        findsNWidgets(77));
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);
    await tester.pumpWidget(Container(child: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
