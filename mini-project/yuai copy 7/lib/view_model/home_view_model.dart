import 'dart:async';

class HomeViewModel {
  final _selectedIndexController = StreamController<int>();

  Stream<int> get selectedIndexStream => _selectedIndexController.stream;

  void updateSelectedIndex(int index) {
    _selectedIndexController.add(index);
  }

  void dispose() {
    _selectedIndexController.close();
  }
}
