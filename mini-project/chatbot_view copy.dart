import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yuai/widget/my_textfield.dart';
import 'package:http/http.dart' as http;

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String _response = "";

  Future<void> _submitForm() async {
    String key = '';
    if (_formKey.currentState!.validate()) {
      final apiKey = key;
      const apiUrl = 'https://api.openai.com/v1/completions';

      final response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $apiKey'
          },
          body: jsonEncode(<String, dynamic>{
            "model": "text-davinci-003",
            'prompt':
                "jika ada yang bertanya kamu siapa, silahkan jawab saya adalah keerdasan buatan dari open AI dengan model davinci 003" +
                    _textController.text,
            'max_tokens': 50, //jumlah token maksimum dalam respon
          }));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Respon Sukses: ${responseData['choice'][0]['text']}');
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        print('Gagal mendapatkan respons. Kode Status: ${response.statusCode}');
      }
    } else {
      print("Insert Value");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MyTextField(
                hintText: 'Input Text',
                obsecureText: false,
                controller: _textController),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('submit'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Respon: $_response')
          ],
        ),
      ),
    );
  }
}
