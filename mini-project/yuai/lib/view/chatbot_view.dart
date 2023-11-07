import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yuai/widget/my_textfield.dart';

// Widget untuk menampilkan halaman ChatBot
class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
   // Kunci form untuk validasi
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Controller untuk input teks
  TextEditingController _textController = TextEditingController();
  // String untuk menyimpan respon dari ChatBot
  String _response = "";

  // Fungsi untuk mengirim pertanyaan ke GPT-3 dan mendapatkan respon
  void _askGPT() async {
    // API key untuk autentikasi
    String apiKey = '';
    // Inisialisasi objek Dio untuk melakukan panggilan HTTP
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    ));

    // Membuat prompt yang akan dikirim ke GPT-3
    String prompt = 
        "kamu adalah perental barang barang autdoor dan kamu bisa menjawab pertanyaan petanyan mengenai rental barang outdoor" + _textController.text;

    // Data yang akan dikirim dalam body request
    Map<String, dynamic> data = {
      "model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 1000,
    };

    try {
      // Mengirim request POST ke GPT-3
      Response response = await dio.post('/completions', data: data);
      // Memeriksa status code respons
      if (response.statusCode == 200) {
        final responseData = response.data;
 
        print('Respon Sukses:${responseData['choices'][0]['text']}');
        // Menyimpan respon dari GPT-3
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
            // Tombol untuk mengirim pertanyaan ke ChatBot
            ElevatedButton(
              onPressed: _askGPT,
              child: Text('submit'),
            ),
            SizedBox(
              height: 20,
            ),
            // Container untuk menampilkan respon dari ChatBot
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
