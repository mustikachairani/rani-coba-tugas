import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuai/view_model/home_view_model.dart'; // Ganti dengan nama proyek Anda

void main() {
  test('Stream emits correct values after updateSelectedIndex', () {
    // Arrange
    final viewModel = HomeViewModel();
    final expectedValues = [0, 1, 2];

    // Act
    final streamSubscription =
        viewModel.selectedIndexStream.listen(expectAsync1((index) {
      // Assert
      expect(index, equals(expectedValues.removeAt(0)));
    }, count: 3));

    // Update selectedIndex
    viewModel.updateSelectedIndex(0);
    viewModel.updateSelectedIndex(1);
    viewModel.updateSelectedIndex(2);

    // Wait for stream to complete
    Future.delayed(Duration.zero, () {
      // Cleanup
      streamSubscription.cancel();
      viewModel.dispose();
    });
  });
}
