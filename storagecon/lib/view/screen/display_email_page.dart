import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class DisplayEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
    final email = signUpProvider.signupData.username; // Get the email data

    return Scaffold(
      appBar: AppBar(
        title: Text('Email Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email Data:', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(email,
                style: TextStyle(fontSize: 18)), // Display the email data
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Navigate back to the previous page
              },
              child: Text('Back to Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}