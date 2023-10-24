import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Halaman Sign In'),
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
                // Tambahkan logika Sign In di sini
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign_up');
              },
              child: Text('Belum punya akun? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}