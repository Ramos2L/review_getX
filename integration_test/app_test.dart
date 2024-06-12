import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:review_getx/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final Finder button = find.byKey(const Key('button'));
  final Finder snackBar = find.byKey(const Key('snack_bar'));

  group('List Page', () {
    testWidgets('deve conter uma stack na page list',
        (WidgetTester tester) async {
      app.main();

      await tester.pump();
      final key = find.byKey(const Key('stack'));

      expect(key, findsOneWidget);
    });

    testWidgets('deve conter um botão na page list',
        (WidgetTester tester) async {
      app.main();

      await tester.pump();
      final key = find.byKey(const Key('button'));

      expect(key, findsOneWidget);
    });

    testWidgets('deve encontrar um texto ao clicar no botao',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.text('write message'), findsOneWidget);
    });
  });
}
