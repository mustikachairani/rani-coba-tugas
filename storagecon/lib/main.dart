import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:muchson/theme/app_theme.dart';
import 'package:muchson/view/screen/contact.dart';
import 'package:muchson/view/screen/sign_in.dart';
import 'package:muchson/view/screen/sign_up.dart';
import 'package:open_file/open_file.dart';
import 'view/screen/galeri.dart';
import 'package:provider/provider.dart';

List data_kontak = [
  {
    "title": "Kepala SUku",
    "jenis_kelamin": "Laki-laki",
    'color': Colors.blue,
  },
  {
    "title": "Guru Bahasa Cinta",
    "jenis_kelamin": "perempuan",
    'color': Colors.blue,
  },
  {
    "title": "Bendahara Sekolah",
    "jenis_kelamin": "Laki-laki",
    'color': Colors.blue,
  },
]; // data  akan  kita dapatkan dari API temen2 back end

class SignUpData {
  String username;
  String email;
  String password;

  SignUpData(
      {required this.username, required this.email, required this.password});
}

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) =>
        SignUpProvider(), // Create an instance of your provider
    child: MaterialApp(
      initialRoute: '/contact',
      routes: {
        '/': (_) => SignUpPage(),
        '/contact': (_) => Contact(),
        '/galeri': (_) => Galeri(),
        '/login': (_) => SignInPage()
      },
      theme: ThemeData(
          fontFamily: 'Roboto_Condensed',
          textTheme:
              TextTheme(bodyLarge: TextStyle(fontWeight: FontWeight.normal))),
      // home: Galeri(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HelloWord();
  }
}

class HelloWord extends StatefulWidget {
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  List<String> checkboxValue = [];
  var isCheckbox1 = false;
  String textFieldData = ''; // Tambahkan ini
  //dua variabel yang dibuat jika ingin menggunakan date
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed,
    //     MaterialState.hovered,
    //     MaterialState.focused,
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.green;
    //   }
    //   return Colors.grey;
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Muchson App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: []),
              SizedBox(
                height: 60,
              ),
              Text('List Kelas D'),
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Perempuan'),
                ],
              ),
              //checkbox simple
              Divider(),
              datePicker(context),
              buildColorPicker(context),
              buildFilePicker(),
              SizedBox(
                height: 2,
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    data_kontak.add({
                      "title": "${inputControllers.text}",
                      "jenis_kelamin": "$radioValue",
                      "skill": "$checkboxValue",
                      "color": "$_currentColor",
                    });
                  });

                  print('data_kontak : $data_kontak');
                },
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data_kontak.length, //3
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text('${data_kontak[index]["title"]}'),
                          subtitle: Column(
                            children: [
                              Text(
                                  'Jenis Kelamin : ${data_kontak[index]["jenis_kelamin"]} '),
                              Text('Color : '),
                              Container(
                                width: 10,
                                height: 10,
                                // color: data_kontak[index][
                                //     "color"], // Menggunakan data color sebagai warna
                              )
                            ],
                          ),
                          trailing: Wrap(children: [
                            IconButton(
                                onPressed: () {
                                  //1. kita harus memasukkan datanya ke dalam onpress
                                  // print('delete $data_kontak');
                                  //2. setelah didapatkan datanya, maka kita olah sehingga data tersebut dihapus ketika tombol di tekah
                                  setState(() {
                                    data_kontak.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () => AlertEdit(context, index),
                                icon: Icon(Icons.edit))
                          ]),
                        );
                      })),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Column datePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));

                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                    }
                  });
                  print('select date');
                },
                child: Text('Select'))
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }

  Future<String?> AlertEdit(BuildContext context, int index) {
    final contact = data_kontak[index]['title'];
    final radioJenisKelamin = data_kontak[index]['jenis_kelamin'];
    TextEditingController nameControllerEdit =
        TextEditingController(text: contact);

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: Column(children: [
                Text('nama'),
                TextField(
                  controller: nameControllerEdit,
                ),
                // buat radio button
                // dalem value di radio button, kamu masukin set up valuenya sama dengan radioJenisKelamin
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      //logika untuk menindih value berdsarkan index
                      print(data_kontak);
                      setState(() {
                        data_kontak[index]["title"] = nameControllerEdit.text;
                      });
                      Navigator.pop(context);
                      print(data_kontak);

                      print('submit edit');
                    },
                    child: Text('Submit Edit')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: Text('Cancel'))
              ],
            )
        // 1. kita panggil semua data
        // print('edit $data_kontak');
        // 2. munculin box baru (show dialog/alert dialog)
        // 3. di dalam box itu (show dialog/alert dialog) membuat form untuk memperharui data
        // 4. masukkan data sebelumnya ke alert dialog tersebut(tempat kita untuk mendapatkan data baru)
        // 5. ketika button di klik, maka data akan berganti
        );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Pick Your Color'),
                          content: BlockPicker(
                              pickerColor: Colors.red,
                              onColorChanged: (color) {
                                setState(() {
                                  print(_currentColor);
                                  _currentColor = color;
                                  print(
                                      'sekarang warna berubah $_currentColor');
                                });
                              }),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            )
                          ],
                        );
                      });
                  print('pick color');
                },
                child: Text('Pick Color')))
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text('Pick File'),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text('Pick and Open File'),
          ),
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
    print('_pickFile');
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

class SignUpProvider extends ChangeNotifier {
  SignUpData _signupData = SignUpData(username: '', email: '', password: '');

  SignUpData get signupData => _signupData;

  void updateUsername(String username) {
    _signupData.username = username;
    notifyListeners();
  }

  void updateEmail(String email) {
    _signupData.email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _signupData.password = password;
    notifyListeners();
  }
}