import 'package:flutter/material.dart';
import 'package:yuai/model/user_model.dart';

class LoginViewKuKuModel {
  
  Future<User?> loginUser(String email, String password) async {
    // Contoh: Validasi pengguna berdasarkan username dan password
    // Gantilah dengan logika autentikasi yang sesuai dengan aplikasi Anda
    if (email == 'rani@gmail.com' && password == '12345') {
      // Jika username dan password valid, kembalikan UserModel sebagai imitasi login sukses
      return User(password: 'password123', email: 'user@example.com');
    } else {
      // Jika username atau password tidak valid, kembalikan null
      return null;
    }
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
}
