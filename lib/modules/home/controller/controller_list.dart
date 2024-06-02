import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerList extends GetxController with StateMixin<List<String>> {
  final _listData = RxList<String>();

  List<String> get listData => _listData;

  @override
  Future<void> onReady() async {
    await loadNames();
    change(state, status: RxStatus.empty());
  }

  Future<void> incrementData(String data) async {
    change(state, status: RxStatus.loading());
    listData.add(data);
    await _saveNames();
    change(state, status: RxStatus.success());
  }

  void decrementData(int index) {
    change(state, status: RxStatus.loading());
    listData.removeAt(index);
    listData.isEmpty
        ? change(state, status: RxStatus.empty())
        : change(state, status: RxStatus.success());
  }

  Future<void> _saveNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('listData', listData);
  }

  Future<void> loadNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listData.addAll(prefs.getStringList('listData') ?? []);
  }
}
