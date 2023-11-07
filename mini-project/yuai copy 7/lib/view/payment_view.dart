import 'package:flutter/material.dart';
import 'package:yuai/view/home_view.dart';
import 'package:yuai/widget/my_textfield.dart';

// Widget untuk menampilkan halaman pembayaran
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // Create controllers for name, phone number, and address
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController rentalDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();

  // Variables to store selected rental and return dates
  DateTime rentalDate = DateTime.now();
  DateTime returnDate = DateTime.now();

   // Fungsi untuk memilih tanggal
  Future<void> _selectDate(
    BuildContext context,
    bool isRentalDate,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isRentalDate ? rentalDate : returnDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null && picked != (isRentalDate ? rentalDate : returnDate)) {
      setState(() {
        isRentalDate ? rentalDate = picked : returnDate = picked;
        controller.text = '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //title
                  Text(
                    'PENYEWAAN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //nama penyewa
                  MyTextField(
                    hintText: 'Nama Penyewa',
                    obsecureText: false,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //nomor telepon
                  MyTextField(
                    hintText: 'Nomor Telepon Penyewa',
                    obsecureText: false,
                    controller: phoneNumberController,
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //alamat penyewa
                  MyTextField(
                    hintText: 'Alamat Penyewa',
                    obsecureText: false,
                    controller: addressController,
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // Tanggal Peminjaman
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal Peminjaman:'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDate(
                                  context, true, rentalDateController),
                              child: Text('Pilih Tanggal'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('${rentalDateController.text}'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  // Tanggal Pengembalian
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tanggal Pengembalian:'),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () => _selectDate(
                                        context, false, returnDateController),
                                    child: Text('Pilih Tanggal'),
                                  ),
                                  SizedBox(width: 20),
                                  Text('${returnDateController.text}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        //button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeView()), // Gantilah dengan nama class halaman history yang sesuai
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(25),
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "SEWA",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
