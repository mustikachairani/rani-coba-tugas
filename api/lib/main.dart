import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FormSubmitWidget extends StatefulWidget {
  @override
  _FormSubmitWidgetState createState() => _FormSubmitWidgetState();
}

class _FormSubmitWidgetState extends State<FormSubmitWidget> {
  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _submitForm() async {
    String formData = _textFieldController.text;

    try {
      // Ganti URL dengan endpoint Anda
      final response = await Dio().post('https://pokeapi.co/api/v2/pokemon/ditto');

      // Handle respon dari server sesuai kebutuhan
      print('Response: ${response.data}');
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Submit with Dio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter Data'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FormSubmitWidget(),
  ));
}
