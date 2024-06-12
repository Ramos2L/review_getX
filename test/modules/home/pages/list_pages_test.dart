import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:review_getx/modules/home/controller/controller_list.dart';
import 'package:review_getx/modules/home/pages/list_pages.dart';

void main() {
  final button = find.byKey(const Key('button'));

  group('List Page', () {
    testWidgets('deve conter uma stack na page list',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          getPages: [
            GetPage(
              name: '/',
              binding: BindingsBuilder.put(() => ControllerList()),
              page: () => const ListPage(),
            ),
          ],
        ),
      );

      await tester.pump();
      final key = find.byKey(const Key('stack'));

      expect(key, findsOneWidget);
    });

    testWidgets('deve conter um botão na page list',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          getPages: [
            GetPage(
              name: '/',
              binding: BindingsBuilder.put(() => ControllerList()),
              page: () => const ListPage(),
            ),
          ],
        ),
      );

      await tester.pump();
      final key = find.byKey(const Key('button'));

      expect(key, findsOneWidget);
    });

    testWidgets('deve encontrar um texto ao clicar no botao',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          getPages: [
            GetPage(
              name: '/',
              binding: BindingsBuilder.put(() => ControllerList()),
              page: () => const ListPage(),
            ),
          ],
        ),
      );
      await tester.pump();
      await tester.tap(button);
      await tester.pump();

      expect(find.text('write message'), findsOneWidget);
    });
  });
}
