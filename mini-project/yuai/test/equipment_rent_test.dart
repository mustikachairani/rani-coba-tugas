import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yuai/model/equipment_model.dart';
import 'package:yuai/model/equipment_rent_model.dart';
import 'package:yuai/view/equipment_view.dart';
import 'package:yuai/view/equipment_view.dart';

void main() {
  testWidgets('Adding item to cart updates UI', (WidgetTester tester) async {
    // Arrange
    final equipmentRent = EquipmentRent();
    final widget = MaterialApp(
      home: ChangeNotifierProvider.value(
        value: equipmentRent,
        child: EquipmentPage(), // Update with the correct widget
      ),
    );

    // Act
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle(); // Wait for animations and async operations

    // Initial UI state
    expect(find.text('User Cart: 0 items'), findsOneWidget);

    // Simulate adding an item to the cart
    equipmentRent.addItemToCart({'id': 1, 'name': 'Laptop', 'price': 1000});
    await tester.pump();
    await tester.pumpAndSettle(); // Wait for animations and async operations

    // Updated UI state
    expect(find.text('User Cart: 1 items'), findsOneWidget);
  });

  testWidgets('Removing item from cart updates UI', (WidgetTester tester) async {
    // Arrange
    final equipmentRent = EquipmentRent();
    final widget = MaterialApp(
      home: ChangeNotifierProvider.value(
        value: equipmentRent,
        child: EquipmentPage(), // Update with the correct widget
      ),
    );

    // Act
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle(); // Wait for animations and async operations

    // Initial UI state
    expect(find.text('User Cart: 0 items'), findsOneWidget);

    // Simulate adding an item to the cart
    equipmentRent.addItemToCart({'id': 1, 'name': 'Laptop', 'price': 1000});
    await tester.pump();
    await tester.pumpAndSettle(); // Wait for animations and async operations

    // Simulate removing the item from the cart
    equipmentRent.removeItemFromCart({'id': 1, 'name': 'Laptop', 'price': 1000});
    await tester.pump();
    await tester.pumpAndSettle(); // Wait for animations and async operations

    // Updated UI state
    expect(find.text('User Cart: 0 items'), findsOneWidget);
  });
}
