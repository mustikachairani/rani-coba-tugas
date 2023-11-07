import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuai/model/user_model.dart';
import 'package:yuai/view_model/loginaku_view_model.dart';

void main() {
  test('LoginUser with valid credentials should return a User', () async {
    // Arrange
    final loginModel = LoginViewKuKuModel();
    final email = 'test@gmail.com';
    final password = 'password123';

    // Act
    final result = await loginModel.loginUser(email, password);

    // Assert
    expect(result, isNotNull);
    expect(result!.email, 'rani@gmail.com'); // Ganti dengan email yang diharapkan
    expect(result.password, '12345'); // Ganti dengan password yang diharapkan
  });

  test('LoginUser with invalid email should return null', () async {
    // Arrange
    final loginModel = LoginViewKuKuModel();
    final email = 'invalidemail';
    final password = 'password123';

    // Act
    final result = await loginModel.loginUser(email, password);

    // Assert
    expect(result, isNull);
  });

  test('LoginUser with invalid password should return null', () async {
    // Arrange
    final loginModel = LoginViewKuKuModel();
    final email = 'test@gmail.com';
    final password = '123'; // Kurang dari 5 karakter

    // Act
    final result = await loginModel.loginUser(email, password);

    // Assert
    expect(result, isNull);
  });
}
