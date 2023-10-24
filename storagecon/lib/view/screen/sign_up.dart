import 'package:flutter/material.dart';
import 'package:muchson/view/screen/display_email_page.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up controller when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Halaman Sign Up'),
            SizedBox(height: 20),
            // Form untuk email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (inputControllers) {},
              ),
            ),
            // Form untuk password
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Menggunakan nilai dari controller
                final email = emailController.text;
                final password = passwordController.text;
                final signUpProvider =
                    Provider.of<SignUpProvider>(context, listen: false);
                signUpProvider.updateUsername(email);
                print('${email}');
                // Tambahkan logika Sign Up di sini
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayEmailPage(),
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign_in');
              },
              child: Text('Sudah punya akun? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}