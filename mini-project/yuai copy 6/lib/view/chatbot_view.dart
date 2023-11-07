import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yuai/widget/my_textfield.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String _response = "";

  void _askGPT() async {
    String apiKey = '';
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    ));

    String prompt =
        "jika ada yang bertanya kamu siapa, silahkan jawab saya adalah keerdasan buatan dari open AI dengan model davinci 003" +
            _textController.text;

    Map<String, dynamic> data = {
      "model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 1000,
    };

    try {
      Response response = await dio.post('/completions', data: data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        print('Respon Sukses: ${responseData['choices'][0]['text']}');
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        print('Gagal mendapatkan respons. Kode Status: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('Error: $e');
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
              onPressed: _askGPT,
              child: Text('submit'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 1000.0, // Lebar Container
              height: 200.0, // Tinggi Container
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Warna border
                  width: 1.0, // Lebar border
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(8.0)), // Jari-jari border
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(8.0), // Jarak antara border dan teks
                child: Text('$_response'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
