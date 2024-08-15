import 'package:flutter/material.dart';
import 'package:flutter_counter_test_project/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// Construir el widget
    await tester.pumpWidget(const MyApp());

// Verificar que el contador inicial es 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

// Presionar el botón de incremento
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

// Verificar que el contador ha incrementado
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
