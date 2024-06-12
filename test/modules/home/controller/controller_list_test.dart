import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:review_getx/modules/home/controller/controller_list.dart';

class ControllerListMock extends Mock implements ControllerList {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ControllerList controllerList;
  late List<String> mockList;

  setUp(() {
    controllerList = ControllerListMock();
    mockList = ['teste'];
    when(() => controllerList.listData).thenReturn(mockList);
  });

  group('Controller List', () {
    test('deve incrementar uma string na lista', () async {
      String dataMock = 'teste';

      when(() => controllerList.incrementData(dataMock)).thenAnswer((_) async {
        mockList.add(dataMock);
      });

      await controllerList.incrementData(dataMock);

      expect(controllerList.listData.contains(dataMock), equals(true));
    });

    test('deve decrementar uma string na lista', () async {
      const index = 0;
      final String list = mockList[index];

      when(() => controllerList.decrementData(index))
          .thenAnswer((_) async {
        mockList.removeAt(index);
      });

      controllerList.decrementData(index);

      expect(controllerList.listData.contains(list), equals(false));
    });
  });
}
