import 'package:flutter/material.dart';
import 'package:yuai/model/user_model.dart';

class LoginViewKuKuModel {
  Future<User?> loginUser(String email, String password) async {
    // Validasi email harus disertai dengan "@gmail.com"
    if (!email.endsWith('@gmail.com')) {
      return null;
    }

    // Validasi password minimal 5 karakter atau angka
    if (password.length < 5) {
      return null;
    }

    // Jika email dan password memenuhi persyaratan, kembalikan UserModel sebagai imitasi login sukses
    return User(password: '12345', email: 'rani@gmail.com');
  }

  void handleLoginResult(User? user, BuildContext context) {
    if (user != null) {
      // Jika login sukses, pindah ke halaman home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Tampilkan pesan kesalahan atau ambil tindakan lainnya jika login gagal
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
