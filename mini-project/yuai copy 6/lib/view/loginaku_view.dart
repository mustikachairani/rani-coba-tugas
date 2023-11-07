// lib/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuai/model/user_model.dart';
import 'package:yuai/view_model/loginaku_view_model.dart';
import 'package:yuai/widget/my_textfield.dart';

class LoginViewKuKu extends StatefulWidget {
  final LoginViewKuKuModel viewModel;

  const LoginViewKuKu({required this.viewModel});

  @override
  _LoginViewKuKuState createState() => _LoginViewKuKuState();
}

class _LoginViewKuKuState extends State<LoginViewKuKu> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Metode yang dipanggil saat tombol "Login" ditekan
  void login() async {
    // Menetapkan bahwa proses login sedang berlangsung
    setState(() {
      isLoading = true;
    });

    // Panggil fungsi login dari ViewModel untuk mendapatkan UserModel
    User? user = await widget.viewModel.loginUser(
      emailController.text,
      passwordController.text,
    );

    // Menetapkan bahwa proses login telah selesai
    setState(() {
      isLoading = false;
    });

    // Handle hasil login menggunakan metode di ViewModel
    widget.viewModel.handleLoginResult(user, context);
  }

  void logout(BuildContext context) {
    // Lakukan logika logout, seperti membersihkan sesi atau token
    // Di sini, kita hanya kembali ke halaman login

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app name
              Text(
                "ECO RENT",
                style: GoogleFonts.roboto(fontSize: 28, color: Colors.black),
              ),
              //image app
              Padding(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'lib/images/tent.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              // TextField untuk input username
              MyTextField(
                hintText: "Email",
                obsecureText: false,
                controller: emailController,
              ),
              SizedBox(
                height: 10.0,
              ),
              // password textfield
              MyTextField(
                hintText: "Password",
                obsecureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 16), // Spasi antara TextField
              // Tombol untuk melakukan login
              ElevatedButton(
                onPressed:
                    login, // Menetapkan metode login sebagai fungsi onPress
                child: isLoading
                    ? CircularProgressIndicator() // Tampilkan indikator loading jika proses login sedang berlangsung
                    : Text(
                        'Login',
                      ), // Tampilkan teks "Login" jika tidak ada proses login
              ),
            ],
          ),
        ),
      ),
    );
  }
}
