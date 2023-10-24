// ignore_for_file: unused_field

import 'package:flutter/material.dart';

List<Map<String, String>> data_kontak = [
  {
    "title": "Kepala SUku",
    "jenis_kelamin": "Laki-laki",
  },
  {
    "title": "Guru Bahasa Cinta",
    "jenis_kelamin": "perempuan",
  },
  {
    "title": "Bendahara Sekolah",
    "jenis_kelamin": "Laki-laki",
  },
  {"title": "Guru Matematika", "jenis_kelamin": "Perempuan"},
  {"title": "Guru Biologi", "jenis_kelamin": "Laki-laki"}
];

void main() {
  runApp(MaterialApp(
    home: MyApp(),
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

  @override
  Widget build(BuildContext context) {
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []),
                SizedBox(height: 60),
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
                      },
                    ),
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
                      },
                    ),
                    Text('Perempuan'),
                  ],
                ),
                Divider(),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    setState(() {
                      data_kontak.add({
                        "title": "${inputControllers.text}",
                        "jenis_kelamin": "$radioValue",
                        "skill": "$checkboxValue"
                      });
                    });
                    print('data_kontak : $data_kontak');
                  },
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data_kontak.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: FlutterLogo(),
                        title: Text('${data_kontak[index]["title"]}'),
                        subtitle: Text('${data_kontak[index]["jenis_kelamin"]}'),
                        trailing: Wrap(children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                data_kontak.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () => _alertEdit(context, index),
                            icon: Icon(Icons.edit),
                          )
                        ]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _alertEdit(BuildContext context, int index) async {
    final contact = data_kontak[index]['title'];
    final radioJenisKelamin = data_kontak[index]['jenis_kelamin'];
    TextEditingController nameControllerEdit =
        TextEditingController(text: contact);

    String? editedRadioValue = radioJenisKelamin;

    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Edit Contact'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nama'),
                  TextField(
                    controller: nameControllerEdit,
                  ),
                  Text('Jenis Kelamin'),
                  Row(
                    children: [
                      Radio(
                        value: 'Laki-laki',
                        groupValue: editedRadioValue,
                        onChanged: (String? value) {
                          setState(() {
                            editedRadioValue = value ?? '';
                          });
                        },
                      ),
                      Text('Laki-laki'),
                      Radio(
                        value: 'Perempuan',
                        groupValue: editedRadioValue,
                        onChanged: (String? value) {
                          setState(() {
                            editedRadioValue = value ?? '';
                          });
                        },
                      ),
                      Text('Perempuan'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      data_kontak[index]["title"] = nameControllerEdit.text;
                      data_kontak[index]["jenis_kelamin"] = editedRadioValue!;
                    });

                    Navigator.pop(context); // Tutup dialog
                  },
                  child: Text('Simpan'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel'); // Tutup dialog
                  },
                  child: Text('Batal'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
